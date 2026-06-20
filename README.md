# 🌤️ Dynamic Weather App

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:4facfe,100:00f2fe&height=220&section=header&text=Weather%20App&fontSize=55&fontColor=ffffff&animation=fadeIn&fontAlignY=38" />
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/MustafaSabry1/weather_app?style=for-the-badge" />
  <img src="https://img.shields.io/github/forks/MustafaSabry1/weather_app?style=for-the-badge" />
  <img src="https://img.shields.io/github/license/MustafaSabry1/weather_app?style=for-the-badge" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/BLoC-State%20Management-7B61FF?style=for-the-badge" />
  <img src="https://img.shields.io/badge/API-WeatherAPI-00C2FF?style=for-the-badge" />
</p>

<p align="center">
  A stylish Flutter weather application with animated skies, dynamic themes, and real-time weather updates for any city in the world.
</p>

---

## 🌈 Preview

<p align="center">
  <img width="800" src="https://user-images.githubusercontent.com/000000/weather-preview-placeholder.gif" />
</p>

> Replace the preview GIF above with a screen recording of your app.

---

## ✨ Features

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart" />
  <img src="https://img.shields.io/badge/BLoC-State%20Management-8A2BE2?style=for-the-badge" />
</p>

<p align="center">
  A modern Flutter weather application with dynamic themes, animated backgrounds, and real-time weather conditions.
</p>

---

## ✨ Features

* 🔍 Search for any city in the world
* 🌡️ Display current temperature, max and min temperature
* 🎨 Dynamic theme changes based on weather condition
* ☀️ Animated sunny background
* 🌧️ Animated rain and cloud effects
* ☁️ Different UI for cloudy, rainy, and sunny weather
* ⚡ Built using BLoC State Management
* 📱 Clean and responsive UI

---

## 📸 Screenshots

> Add your screenshots here after uploading them to GitHub.

```md
![Sunny Screen](screenshots/sunny.png)
![Rainy Screen](screenshots/rainy.png)
![Cloudy Screen](screenshots/cloudy.png)
```

---

## 🛠️ Tech Stack

* Flutter
* Dart
* flutter_bloc
* Dio
* WeatherAPI

---

## 📂 Project Structure

```text
lib/
│
├── Cubits/
│   └── get_weather_state/
│       ├── get_weather_Cubit.dart
│       └── Get_Weather_states.dart
│
├── models/
│   └── Weather_Models.dart
│
├── services/
│   └── Weather_Services.dart
│
├── pages/
│   └── Home_View.dart
│
├── View/
│   └── Search_view.dart
│
├── widgets/
│   ├── Weather_info_body.dart
│   └── No_weatherBody.dart
│
└── main.dart
```

---

## 🚀 Getting Started

1. Clone the repository:

```bash
git clone https://github.com/MustafaSabry1/weather_app.git
```

2. Open the project:

```bash
cd weather_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

---

## 🔑 API Setup

This project uses WeatherAPI.

1. Create an account at: [https://www.weatherapi.com/](https://www.weatherapi.com/)
2. Get your API key
3. Replace the key inside:

```dart
WeatherServices.dart
```

```dart
final String apiKey = 'YOUR_API_KEY';
```

---

## 🎨 Weather Theme Logic

| Weather Condition | Theme Color |
| ----------------- | ----------- |
| Sunny / Clear     | Orange      |
| Partly Cloudy     | Light Blue  |
| Cloudy / Overcast | Blue Grey   |
| Rain              | Blue        |
| Thunder           | Deep Purple |
| Snow              | Cyan        |

---

## 👨‍💻 Author

Created by Mostafa Sabry

* GitHub: [https://github.com/MustafaSabry1](https://github.com/MustafaSabry1)

---

<p align="center">
  Made with ❤️ using Flutter
</p>
