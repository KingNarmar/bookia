# 📚 Bookia — Flutter Bookstore App

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![State Management](https://img.shields.io/badge/State%20Management-Cubit-purple)
![Architecture](https://img.shields.io/badge/Architecture-Feature%20Based-green)
![API](https://img.shields.io/badge/API-Dio-orange)

A modern **Flutter bookstore application** built as part of the Flutter course sessions  
(Session 15 → Session 19).

The project demonstrates how to build a **production-style Flutter architecture** including:

- Authentication Flow
- API Integration
- State Management
- Feature-Based Architecture
- Dynamic Home Screen
- Shimmer Loading UI
- Reusable Widgets

---

# 📱 App Screens Preview

## Splash Screen

<img src="screen_shots/splash_screen.png" width="300"/>

---

## Welcome Screen

<img src="screen_shots/welcome_screen.png" width="300"/>

---

## Login Screen

<img src="screen_shots/Login_screen.png" width="300"/>

Features:

- Email & Password fields
- Password visibility toggle
- Form validation
- Social authentication buttons
- Connected to backend login endpoint
- State handling using Cubit

---

## Register Screen

<img src="screen_shots/register_screen.png" width="300"/>

Features:

- Username validation
- Email validation
- Password confirmation
- Custom reusable password field
- Connected to backend register API

---

## Forgot Password Screen

<img src="screen_shots/forget_password_screen.png" width="300"/>

Features:

- Email validation
- Connected to Forget Password API
- Loading and error handling
- Navigation to OTP screen after successful request

---

## OTP Verification Screen

<img src="screen_shots/otp_verification_screen.png" width="300"/>

Features:

- PIN code input
- OTP verification
- Resend code option
- Navigation to Create New Password screen

---

## Create New Password Screen

<img src="screen_shots/create_new_password_screen.png" width="300"/>

Features:

- New password input
- Confirm password input
- Validation handling
- Connected to Reset Password API

---

## Password Changed Screen

<img src="screen_shots/password_changed_screen.png" width="300"/>

Features:

- Success state UI
- Navigation back to Login screen

---

## Home Screen

<img src="screen_shots/home_screen.png" width="300"/>

Features:

- Dynamic promotional slider
- Best seller books section
- API integration using Dio
- State management using Cubit
- Reusable widgets
- Loading shimmer placeholders

---

# 🏗 Architecture

The project follows **Feature-Based Architecture**.

```
lib
 ├── core
 │   ├── constants
 │   ├── services
 │   ├── widgets
 │   ├── styles
 │   └── routes
 │
 ├── features
 │   ├── auth
 │   │   ├── data
 │   │   └── presentation
 │   │
 │   └── home
 │       ├── data
 │       └── presentation
 │
 └── main.dart
```

Benefits:

- Clean structure
- Scalable architecture
- Feature isolation
- Easy maintenance

---

# ⚡ Shimmer Loading System

To improve user experience while waiting for API responses, a **Shimmer loading system** was implemented.

Loading widgets include:

```
SliderShimmer
GridShimmer
BookCardShimmer
TextShimmer
ListShimmer
```

These components display skeleton UI placeholders until the real data is loaded.

---

# 🔌 API Integration

The application communicates with backend APIs using **Dio**.

### Authentication APIs

```
POST /login
POST /register
POST /forget-password
POST /reset-password
```

### Home APIs

```
GET /sliders
GET /products-bestseller
```

Repositories used:

```
AuthRepo
HomeRepo
```

---

# 🧠 State Management

The project uses **Flutter Bloc / Cubit**.

### AuthCubit

Handles:

- Login
- Register
- Password reset
- Form validation
- Error states

### HomeCubit

Handles:

- Fetch slider data
- Fetch best seller products
- Loading states
- Error states

---

# 🧩 Reusable Widgets

Core widgets:

```
MainButton
CustomTextFormField
PasswordTextFormField
Dialogs
```

Auth widgets:

```
SocialAuthButton
AuthFooter
PinCodeSection
```

Home widgets:

```
HomeSlider
BookCard
```

Loading widgets:

```
SliderShimmer
GridShimmer
BookCardShimmer
TextShimmer
```

---

# 🛠 Tech Stack

- Flutter
- Dart
- Flutter Bloc / Cubit
- Dio
- Carousel Slider
- Smooth Page Indicator
- SVG Support
- Shimmer Loading UI

---

# 🎯 Learning Goals

This project helped practice:

- Clean UI implementation from Figma
- API integration with Dio
- State management using Cubit
- Feature-based architecture
- JSON parsing into Dart models
- Building a complete authentication flow
- Building dynamic home screens
- Creating reusable widgets
- Implementing shimmer loading UI