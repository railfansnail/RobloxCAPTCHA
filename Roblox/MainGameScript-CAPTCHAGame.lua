local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService") -- TeleportService �߰�

local authorizedUsers = {} -- ������ ����� ����

-- ����� ���� ���� ����
local function saveUserAuth(userId)
	authorizedUsers[userId] = { authorized = true }
end

-- ����� ���� ���� Ȯ��
local function isUserAuthorized(userId)
	return authorizedUsers[userId] and authorizedUsers[userId].authorized or false
end

-- HttpService ��û ó��
game.ReplicatedStorage.UserAuth.OnServerEvent:Connect(function(player)
	local userId = player.UserId
	local url = "https://c9f8-61-77-162-232.ngrok-free.app/auth" -- ngrok URL

	local success, err = pcall(function()
		HttpService:PostAsync(url, HttpService:JSONEncode({ userId = userId }), Enum.HttpContentType.ApplicationJson)
	end)

	if success then
		saveUserAuth(userId) -- ���� ���� ����
		print("����� " .. userId .. " ������")

		-- ���� �Ϸ� �� �� �������� �ڷ���Ʈ
		TeleportService:Teleport(12333354851, player) -- �� ���� ID
	else
		warn("���� ���� ����: " .. err)
	end
end)
