![Image](https://github.com/user-attachments/assets/c96d3b79-fd5e-41a0-8dcc-52400da018b0)

## 📖 Project Overview

UpStock is a mobile application designed to provide real-time updates on U.S. stock indices with a user-friendly interface. It supports user authentication via Firebase, stock data visualization, and user feedback submission. Additionally, the app enhances user experience with smooth loading animations using Shimmer effects.

## 🔍 WBS

<img width="80%" alt="wbs" src="https://github.com/user-attachments/assets/f82c939e-e7f5-46f3-bfe1-6d2be299a9ff" />

## 🏗️ Future Development Plans

✅ Short-Term Goals (1–3 months)

User Data Storage: Implement user-specific stock watchlists using Firebase Firestore

Chart Enhancements: Introduce more chart types and extended time frames for stock index variations

Notification System: Enable alerts for significant stock index fluctuations

## 🚀 Mid-to-Long-Term Goals (3–6 months)

Portfolio Management: Allow users to create their own investment portfolios and track real-time value changes

Social Features: Introduce community features for sharing stock insights and discussions

Server Optimization: Optimize data structure and backend scalability to reduce Firebase costs

Multi-Platform Support: Expand support for iOS and web versions

UpStock aims to help users analyze real-time stock data and make informed investment decisions more conveniently. With continuous updates, the app will evolve into a more intuitive and powerful tool for stock market enthusiasts.

## 📊 Target User Flow

The following diagram illustrates the user flow within the UpStock application :

<img width="80%" alt="wbs" src="https://github.com/user-attachments/assets/259887bc-e2e7-485e-a95e-e47d14c24fd9" />

### 🔑 Authentication Process

When the app is launched, it first checks if the user is logged in.

If the user is not logged in, they are redirected to the Login Screen.

If they don't have an account, they can proceed to the Sign-up Screen to create an account.

If the user is logged in, they are directed to the Main Community Screen.

### 🏠 Main Community Screen

Users can access two key features:

View major stock indices (e.g., Dow Jones, Nasdaq 100)

Browse user-generated posts

If a user wants to upload a post, they are redirected to the Post Upload Screen.

### 📝 Post Upload Process

Users can create a new post that includes stock-related content.

They can choose to reference stock market information in their posts.

Once uploaded, posts appear in the Community Feed.

### 👤 Profile Section

Users can access their Profile Screen, where they can:

Navigate to Theme Settings to adjust app appearance.

Provide feedback through the Feedback Screen, which is linked to the home page.

View announcements from the Announcements Screen, which retrieves data from the Firebase server.

Review the Privacy Policy & Terms of Service.

The user flow ensures a seamless experience by integrating stock tracking, community engagement, and personalization options. 

## 🧑‍💻 Contributors and Contribution Areas

|                [장성준 (NE7K)](https://github.com/NE7K)                |                 [조예나 (yyyenaak)](https://github.com/yyyenaak)                  |
| :---------------------------------------------------------------------------: | :---------------------------------------------------------------------------: |
| ![Sungjun Jang's profile picture](https://avatars.githubusercontent.com/u/81324262?v=4) | ![Yena Cho's profile picture](https://avatars.githubusercontent.com/u/170397500?v=4) |
| Application development | Feedback page development |

## 💿 Packages used and planned to be used

```
  flutter:
    sdk: flutter

  # 서버 필수 패키지
  http: ^1.3.0

  # firebase package
  firebase_core: ^3.10.1
  firebase_auth: ^5.4.1
  firebase_storage: ^12.4.4
  cloud_firestore: ^5.6.2

  # flutter web view
  webview_flutter: ^4.10.0

  # 주식 차트용 핵심 외부 패키지
  fl_chart: ^0.64.0

  # Shimmer 효과 (Shimmer Loading)
  shimmer: ^3.0.0

  # 이미지 선택
  image_picker: ^1.1.2

  # 타임 스탬프
  timeago: ^3.7.0

  # home header slide
  carousel_slider: ^5.0.0

  # -- 추후 사용 예정 패키지 --

  # SharedPreferences
  shared_preferences: ^2.5.2

  # 이미지 크롭
  image_cropper: ^9.0.0

  # 함수 정리 및 공유
  provider: ^6.1.2

```


## 🚀 Installation and Setup

```bash
# Clone the repository
git clone https://github.com/NE7K/upstock.git

# Move to the project directory
cd upstock

# Install dependencies
flutter pub get

# Run the application
flutter run
```

## 📋 Features

- Registration and login using Firebase
- View US stock indices (Dow Jones, Nasdaq)
- Supports dark mode
- Customizable application theme based on user system
- Feedback functionality

## 🛠️ Tech Stack

- Frontend: Flutter (Dart)
- Backend: Firebase (Auth, Firestore, Storage)
- Networking: REST API (http package)
- Data Visualization: fl_chart
- UI Enhancements: shimmer, carousel_slider


## 📂 Project Structure
```
upstock/
│── lib/
│   ├── main.dart                 # Main entry point
│   ├── account/                  # Authentication
│   │   ├── login.dart            # Login page
│   │   ├── register.dart         # Register page
│   │   ├── search.dart           # Search functionality
│   ├── firebase/                 # Firebase configuration
│   │   ├── firebase_options.dart # Firebase settings
│   ├── home/                     # Home components
│   │   ├── home.dart             # Home page
│   │   ├── homebody.dart         # Home body UI
│   │   ├── homeheader.dart       # Header with stock chart
│   ├── profile/                  # User profile settings
│   │   ├── profile.dart          # Profile page
│   │   ├── setting.dart          # Account settings
│   │   ├── announcement.dart     # Announcement page
│   │   ├── information.dart      # Privacy policy
│   │   ├── peedback.dart         # Feedback form
│   │   ├── screen.dart           # Dark mode settings
│   ├── shimmer/                  # Shimmer effects for loading states
│   │   ├── homebodyshimmer.dart  # Shimmer effect for home body
│   │   ├── homeheadershimmer.dart # Shimmer effect for header
│   ├── style/                    # Global styles
│   │   ├── style.dart            # Theme and styles
│   ├── upload/                   # Upload functionality
│   │   ├── upload.dart           # Image and post upload
│   ├── test.dart                 # Test components
```

## 📷 Screens

### 1️⃣ Login & Sign-up
Users can create an account and log in using Firebase authentication.

<p align="left"> <img src="https://github.com/user-attachments/assets/6b7dc615-b7fe-465a-b700-1d2100a3381e" width="250"> <img src="https://github.com/user-attachments/assets/255d3513-7039-4d13-87be-92dfde4ccc16" width="250"> </p>

### 2️⃣ Main Community Screen
Users can view major stock indices and browse user-generated posts.

<p align="left"> <img src="https://github.com/user-attachments/assets/9699b3d4-5989-46a4-b7fb-a2eb832144b4" width="250"> </p>

### 3️⃣ Post Upload
Users can create new posts that include stock-related content.

<p align="left"> <img src="https://github.com/user-attachments/assets/4f93141a-561e-4b97-94f3-ead3ce461d3d" width="250"> </p>

### 4️⃣ Profile Screen
Users can access their profile to view details and modify settings.

<p align="leftr"> <img src="https://github.com/user-attachments/assets/5a24ae5c-960f-451e-ad63-71919b64faeb" width="250">
  <img src="https://github.com/user-attachments/assets/41c90cab-1849-40a3-8ff7-583308f4703f" width="250"> </p>


## 📝 Contribution Guide

1. Fork this repository.
2. Create a new branch. (`git checkout -b feature/AmazingFeature`)
3. Commit your changes. (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch. (`git push origin feature/AmazingFeature`)
5. Open a pull request.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


## 📧 Contact

For questions or feedback, please contact [NE7K](mailto:sjjang16@naver.com) or [NeighborSoft](mailto:neighborsoft@gmail.com).
