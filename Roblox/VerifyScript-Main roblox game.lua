local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local AUTHORIZED_USERS_URL = "https://c9f8-61-77-162-232.ngrok-free.app/getAuthorizedUsers" -- ngrok URL
local CAPTCHA_GAME_ID = 99520096811655 -- CAPTCHA 게임 ID

-- 플레이어 추가 시 인증 상태 확인
Players.PlayerAdded:Connect(function(player)
	local userId = player.UserId

	-- 인증된 사용자 목록 요청
	local success, response = pcall(function()
		return HttpService:GetAsync(AUTHORIZED_USERS_URL)
	end)

	if success then
		local data = HttpService:JSONDecode(response)
		if data.success then
			local authorizedUsers = data.authorizedUsers

			-- 인증된 사용자 확인
			if not authorizedUsers[tostring(userId)] then
				print(player.Name .. "은 인증이 필요합니다. CAPTCHA 게임으로 텔레포트합니다.")
				-- CAPTCHA 게임으로 텔레포트
				TeleportService:Teleport(CAPTCHA_GAME_ID, player)
			else
				print(player.Name .. "은 인증된 사용자입니다.")
				-- 인증된 경우 본 게임 로직 추가
				-- 여기에 본 게임의 추가 로직을 작성하세요.
			end
		else
			warn("인증된 사용자 목록 요청 실패: " .. data.message)
		end
	else
		warn("사용자 목록 요청 중 오류 발생: " .. response)
	end
end)
