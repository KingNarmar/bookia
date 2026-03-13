# 📚 Bookia — Flutter Bookstore App

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![State Management](https://img.shields.io/badge/State%20Management-Cubit-purple)
![Architecture](https://img.shields.io/badge/Architecture-Feature%20Based-green)
![API](https://img.shields.io/badge/API-Dio-orange)

A modern **Flutter bookstore application** built as part of the Flutter course sessions  
(Session 15 → Session 19).

The project demonstrates how to build a **real production-style Flutter architecture** including:

- Authentication Flow
- API Integration
- State Management
- Feature-based Architecture
- Dynamic Home Screen
- Shimmer Loading UI
- Reusable Widgets

---

# 📱 App Preview

| Splash | Login | Home |
|------|------|------|
| <img src="screen_shots/splash_screen.png" width="200"/> | <img src="screen_shots/login_screen.png" width="200"/> | <img src="screen_shots/home_screen.png" width="200"/> |

---

# 🏗 Architecture

The project follows a **Feature-Based Architecture**.

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

Benefits of this architecture:

- Highly scalable
- Easy to maintain
- Feature isolation
- Clean separation of concerns

---

# ⚡ Key Features

## 🔐 Authentication System

Includes a complete authentication flow:

- Login
- Register
- Forgot Password
- OTP Verification
- Reset Password

All connected to backend APIs using **Dio**.

---

## 🏠 Home Screen

The Home screen fetches dynamic content from backend APIs including:

- Promotional slider banners
- Best seller books

Features:

- Grid layout
- Dynamic data
- Reusable widgets
- Smooth slider indicator

---

## ⚡ Shimmer Loading UI

Skeleton loading was implemented to improve UX while waiting for API responses.

Example shimmer widgets:

```
SliderShimmer
GridShimmer
BookCardShimmer
TextShimmer
ListShimmer
```

This provides a **modern loading experience similar to production apps**.

---

# 🔌 API Integration

The app communicates with backend APIs using **Dio**.

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

---

# 🧠 State Management

The application uses **Flutter Bloc / Cubit**.

### AuthCubit

Responsible for:

- Login
- Register
- Password reset
- Form validation
- Error handling

---

### HomeCubit

Responsible for:

- Fetching sliders
- Fetching best sellers
- Handling loading states
- Handling errors

---

# 🧩 Reusable Widgets

Core reusable components include:

```
MainButton
CustomTextFormField
PasswordTextFormField
Dialogs
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

This project was built to practice:

- Clean UI implementation
- Feature-based architecture
- API integration
- State management
- JSON parsing
- Clean reusable widgets
- Production-style Flutter architecture

---

# 📌 Project Evolution

The project started as a **simple UI task** and evolved into a **complete Flutter architecture** including:

- backend API integration
- state management
- loading skeleton UI
- modular structure

Session 19 mainly focused on:

- Shimmer loading UI
- Improved API models
- Centralized routing
- Cleaner architecture