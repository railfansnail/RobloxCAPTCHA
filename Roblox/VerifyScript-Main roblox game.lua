local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local AUTHORIZED_USERS_URL = "https://c9f8-61-77-162-232.ngrok-free.app/getAuthorizedUsers" -- ngrok URL
local CAPTCHA_GAME_ID = 99520096811655 -- CAPTCHA ���� ID

-- �÷��̾� �߰� �� ���� ���� Ȯ��
Players.PlayerAdded:Connect(function(player)
	local userId = player.UserId

	-- ������ ����� ��� ��û
	local success, response = pcall(function()
		return HttpService:GetAsync(AUTHORIZED_USERS_URL)
	end)

	if success then
		local data = HttpService:JSONDecode(response)
		if data.success then
			local authorizedUsers = data.authorizedUsers

			-- ������ ����� Ȯ��
			if not authorizedUsers[tostring(userId)] then
				print(player.Name .. "�� ������ �ʿ��մϴ�. CAPTCHA �������� �ڷ���Ʈ�մϴ�.")
				-- CAPTCHA �������� �ڷ���Ʈ
				TeleportService:Teleport(CAPTCHA_GAME_ID, player)
			else
				print(player.Name .. "�� ������ ������Դϴ�.")
				-- ������ ��� �� ���� ���� �߰�
				-- ���⿡ �� ������ �߰� ������ �ۼ��ϼ���.
			end
		else
			warn("������ ����� ��� ��û ����: " .. data.message)
		end
	else
		warn("����� ��� ��û �� ���� �߻�: " .. response)
	end
end)
