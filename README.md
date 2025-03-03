![Image](https://github.com/user-attachments/assets/c96d3b79-fd5e-41a0-8dcc-52400da018b0)

## 📖 Project Overview

UpStock is a mobile application designed to provide real-time updates on U.S. stock indices with a user-friendly interface. It supports user authentication via Firebase, stock data visualization, and user feedback submission. Additionally, the app enhances user experience with smooth loading animations using Shimmer effects.

## 🔍 Key Features

User Authentication: Registration and login functionality via Firebase Authentication

Stock Index Tracking: Real-time updates on major indices such as Dow Jones and Nasdaq 100

Chart Visualization: Intuitive data visualization powered by the fl_chart package

Feedback System: Allows users to submit feedback via WebView

Dark Mode Support: UI theme adapts automatically to the user's system settings

Shimmer Effect: Smooth loading animations for enhanced user experience

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

<img src="https://github.com/user-attachments/assets/cf2d9c62-4d8d-4fbe-8ff6-4b94502d7858" width="80%">

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
