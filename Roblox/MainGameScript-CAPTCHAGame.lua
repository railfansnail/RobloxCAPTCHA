local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService") -- TeleportService 추가

local authorizedUsers = {} -- 인증된 사용자 저장

-- 사용자 인증 상태 저장
local function saveUserAuth(userId)
	authorizedUsers[userId] = { authorized = true }
end

-- 사용자 인증 상태 확인
local function isUserAuthorized(userId)
	return authorizedUsers[userId] and authorizedUsers[userId].authorized or false
end

-- HttpService 요청 처리
game.ReplicatedStorage.UserAuth.OnServerEvent:Connect(function(player)
	local userId = player.UserId
	local url = "https://c9f8-61-77-162-232.ngrok-free.app/auth" -- ngrok URL

	local success, err = pcall(function()
		HttpService:PostAsync(url, HttpService:JSONEncode({ userId = userId }), Enum.HttpContentType.ApplicationJson)
	end)

	if success then
		saveUserAuth(userId) -- 인증 상태 저장
		print("사용자 " .. userId .. " 인증됨")

		-- 인증 완료 후 본 게임으로 텔레포트
		TeleportService:Teleport(12333354851, player) -- 본 게임 ID
	else
		warn("인증 저장 실패: " .. err)
	end
end)
