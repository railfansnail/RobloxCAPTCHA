# Roblox 간단 숫자 CAPTCHA 설정 가이드 / Roblox Simple Number CAPTCHA Setup Guide

## 사용 방법 / How to Use?

### 1단계: 게임 설정 / Step 1: Set Up Your Games
- **게임 만들기**: 메인 게임과 CAPTCHA 게임을 준비합니다.  
  **Create Your Games**: Ensure you have your main Roblox game and a CAPTCHA game ready.
- **서버 준비**: Linux 또는 Windows 서버 중 하나를 사용할 수 있습니다.  
  **Prepare a Server**: You can use either a Linux or Windows server.

### 2단계: Roblox 게임에 스크립트 추가 / Step 2: Add Scripts to Your Roblox Game
- **Roblox 폴더 스크립트**: 메인 게임과 CAPTCHA 게임의 Roblox 폴더에 필요한 CAPTCHA 스크립트를 포함합니다. 필요에 따라 수정하세요.  
  **Roblox Folder Script**: Include the necessary CAPTCHA script in the Roblox folder of both your main game and CAPTCHA game. Modify it as needed.

### 3단계: 서버에 Node.js 설정 / Step 3: Set Up Node.js on Your Server
- **Node.js 폴더 스크립트**: 서버 측 CAPTCHA 스크립트를 배치합니다. 이 스크립트는 CAPTCHA 논리와 Roblox 게임 간의 통신을 처리합니다.  
  **Node.js Folder Script**: Place your server-side CAPTCHA script in the Node.js folder on your server. This will handle the CAPTCHA logic and communication with your Roblox games.

### 4단계: Roblox 게임 스크립트 수정 / Step 4: Edit Your Roblox Game Scripts
- **스크립트 수정**: Roblox 게임의 스크립트를 당신의 서버와 게임에 맞게 수정하세요.  
  **Script Modifications**: Modify the scripts in your Roblox games to include the logic for communicating with the Node.js server for CAPTCHA verification.

### 5단계: 서버 스크립트 수정 / Step 5: Edit Your Server Scripts
- **서버 구성**: Roblox 게임에서 들어오는 요청을 처리할 수 있도록 서버 스크립트를 조정합니다.  
  **Configure Your Server**: Make the necessary adjustments to the server scripts to handle incoming requests from your Roblox games.

### 6단계: ngrok 설치 및 구성 / Step 6: Install and Configure ngrok
- **ngrok 설치**: 서버에 ngrok을 설치하고, 계정이 없다면 계정을 생성합니다.  
  **Ngrok Installation**: Install ngrok on your server and create an account if you haven't done so already.
- **ngrok에 로그인**: ngrok을 인증합니다. 자세한 내용은 ngrok 사이트를 참조하십시오.  
  **Sign In to ngrok**: Authenticate ngrok with your account to allow secure tunneling.

### 7단계: 서버와 ngrok 실행 / Step 7: Run Your Server and ngrok
- **서버 시작**: 서버 터미널에서 `node server.js` 명령어를 실행하여 Node.js 서버를 시작합니다.  
  **Start Your Server**: In your server terminal, run the command `node server.js` to start your Node.js server.
- **ngrok 실행**: `ngrok http 3000`을 실행하여 서버로의 보안 터널을 생성합니다. 이렇게 하면 Roblox 게임과 연결할 수 있는 공개 URL이 생성됩니다.  
  **Run Ngrok**: Execute `ngrok http 3000` to create a secure tunnel to your server. This will give you a public URL that can be used to connect with your Roblox games.

### 8단계: 즐기기! / Step 8: Enjoy!
- **테스트**: Roblox 게임을 실행하고 CAPTCHA 시스템이 제대로 작동하는지 확인합니다. 플레이어의 CAPTCHA 응답에 따라 올바르게 텔레포트되는지 테스트합니다.  
  **Testing**: Launch your Roblox games and ensure that the CAPTCHA system is functioning as intended. Test the verification process to ensure players are correctly teleported based on their CAPTCHA response.

### GUI 요소 생성 및 테스트 / Create and Test GUI Elements
- **스크립트에 맞게 GUI를 생성하고, 테스트하여 모든 요소가 올바르게 작동하는지 확인하세요.**  
  **Create GUI elements according to the script and test to ensure that all components are functioning correctly.**
