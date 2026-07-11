# 🎬 Movies App

A modern Flutter movie discovery application built with **BLoC** for state management and **Firebase** for authentication, featuring a clean, cinematic UI and multi-language support.

## 📌 Overview

Movies App lets users browse trending, popular, and upcoming films through a responsive, carousel-driven interface. Authentication is handled via Firebase (email/password and Google Sign-In), and the app is built with scalability and testability in mind through a strict separation between business logic and UI.

## 🏗️ Architecture & State Management

- **State Management:** `flutter_bloc` (^9.1.1) — separates business logic from the UI layer for a reactive, testable codebase.
- **Dependency Management:** `provider` — manages object lifecycles and data flow across the widget tree.
- **Localization:** Built-in internationalization via `flutter_localizations` and `intl`, with `generate: true` enabled for auto-generated localized strings.

## 🛠️ Tech Stack

**Core**
- Flutter SDK `^3.9.0`
- Dart

**Backend & Auth**
- `firebase_core` — Firebase initialization
- `firebase_auth` — email/password registration, login, and session persistence
- `google_sign_in` — one-tap social authentication

**Networking & Data**
- `http` — fetches movie data (trending/popular/upcoming) from an external API
- `shared_preferences` — local persistence for settings and cached preferences

**UI & UX**
- `google_fonts` — custom typography
- `carousel_slider` — featured/trending movie displays
- `flutter_native_splash` — branded splash screen with dark mode support (`#121312`)
- `cupertino_icons` — iOS-style iconography

## 📂 Project Structure

```
lib/
├── core/             # API constants, themes, and shared utilities
├── data/             # Models and repositories (HTTP logic)
├── business_logic/   # BLoC / Cubits for state management
├── presentation/     # UI screens, widgets, and pages
└── l10n/             # Localization files (AR/EN)
```

## 🚀 Key Features

- **Authentication** — secure login/signup via email & password or Google Sign-In
- **Movie Discovery** — browse via carousel and list views
- **Localization** — multi-language support (AR/EN) out of the box
- **Dark Mode** — themed splash screen and UI assets for light/dark modes
- **Branded Launch Experience** — custom native splash screen on app start

## ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/DinaAli261/movies.git
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a project on the [Firebase Console](https://console.firebase.google.com/)
   - Add Android/iOS apps and download `google-services.json` / `GoogleService-Info.plist`
   - Run:
     ```bash
     flutterfire configure
     ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🎨 Assets

- **Images:** `assets/images/` — splash screen, branding, and logos
- **Fonts:** managed dynamically via `google_fonts`

## 📝 Notes

- `generate: true` is enabled in `pubspec.yaml`, so localization/model code is auto-generated — run `flutter pub get` after pulling changes to `.arb` files.
- The app is optimized for both Android and iOS, with platform-specific native splash configuration.
