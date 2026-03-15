# 📚 Bookia — Flutter Bookstore App

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![State Management](https://img.shields.io/badge/State%20Management-Cubit-purple)
![Architecture](https://img.shields.io/badge/Architecture-Feature%20Based-green)
![API](https://img.shields.io/badge/API-Dio-orange)
![Navigation](https://img.shields.io/badge/Navigation-GoRouter-red)
![Storage](https://img.shields.io/badge/Local%20Storage-SharedPreferences-yellow)

A modern **Flutter bookstore application** built as part of the Flutter course sessions  
**Session 15 → Session 20**.

The project demonstrates how to build a **production-style Flutter app** with:

- Authentication Flow
- API Integration with Dio
- State Management using Cubit
- Feature-Based Architecture
- Dynamic Home Screen
- Wishlist System
- Book Details Screen
- SharedPreferences Local Caching
- Reusable Widgets
- Shimmer Loading UI
- GoRouter Navigation

---

# ✨ What’s New in Session 20

In **Session 20**, the project was extended with new e-commerce style functionality:

- Added **Wishlist Screen**
- Added **Book Details Screen**
- Added **Add to Wishlist** functionality
- Added **Remove from Wishlist** functionality
- Added **Wishlist API integration**
- Added **local caching for wishlist IDs** using `SharedPreferences`
- Added **Hero animation** between product card and details screen
- Added **bottom navigation integration** for Wishlist
- Added **wishlist state handling** using `Cubit`

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

### Features:
- Email & Password fields
- Password visibility toggle
- Form validation
- Social authentication buttons
- Connected to backend login endpoint
- State handling using Cubit

---

## Register Screen

<img src="screen_shots/register_screen.png" width="300"/>

### Features:
- Username validation
- Email validation
- Password confirmation
- Custom reusable password field
- Connected to backend register API

---

## Forgot Password Screen

<img src="screen_shots/forget_password_screen.png" width="300"/>

### Features:
- Email validation
- Connected to Forget Password API
- Loading and error handling
- Navigation to OTP screen after successful request

---

## OTP Verification Screen

<img src="screen_shots/otp_verification_screen.png" width="300"/>

### Features:
- PIN code input
- OTP verification
- Resend code option
- Navigation to Create New Password screen

---

## Create New Password Screen

<img src="screen_shots/create_new_password_screen.png" width="300"/>

### Features:
- New password input
- Confirm password input
- Validation handling
- Connected to Reset Password API

---

## Password Changed Screen

<img src="screen_shots/password_changed_screen.png" width="300"/>

### Features:
- Success state UI
- Navigation back to Login screen

---

## Home Screen

<img src="screen_shots/home_screen.png" width="300"/>

### Features:
- Dynamic promotional slider
- Best seller books section
- API integration using Dio
- State management using Cubit
- Reusable widgets
- Loading shimmer placeholders
- Navigation to Book Details screen

---

## Wishlist Screen

<img src="screen_shots/wish_list_screen.png" width="300"/>

### Features:
- Displays all wishlisted books
- Grid layout for saved items
- Remove item from wishlist
- Empty state handling
- Loading shimmer while fetching data
- Integrated inside bottom navigation

---

## Book Details Screen

<img src="screen_shots/book_details_screen.png" width="300"/>

### Features:
- Large book cover preview
- Book title and category display
- Detailed description section
- Add to wishlist action
- Hero animation from product card
- Bottom action area with price and buy button

---

# 🏗 Architecture

The project follows **Feature-Based Architecture** for better scalability and maintainability.

```text
lib
├── app_root
│   └── app_root.dart
│
├── core
│   ├── constants
│   ├── functions
│   ├── routes
│   ├── services
│   │   ├── api
│   │   └── local
│   ├── styles
│   └── widgets
│       └── shimmer
│
├── features
│   ├── auth
│   │   ├── data
│   │   └── presentation
│   │
│   ├── home
│   │   ├── data
│   │   └── presentation
│   │
│   ├── book_details
│   │   └── presentation
│   │
│   ├── wish_list
│   │   ├── data
│   │   └── presentation
│   │
│   ├── main
│   │   └── main_app_screen.dart
│   │
│   └── welcome
│       └── screens
│
└── main.dart
```

### Benefits:
- Clean structure
- Feature isolation
- Easier maintenance
- Better scalability
- Reusable business logic

---

# ⚡ Shimmer Loading System

To improve user experience while waiting for API responses, a **Shimmer loading system** was implemented.

### Loading widgets include:

```dart
SliderShimmer
GridShimmer
BookCardShimmer
TextShimmer
ListShimmer
```

These components display skeleton placeholders until the real API data is loaded.

---

# 🔌 API Integration

The application communicates with backend APIs using **Dio**.

## Authentication APIs

```http
POST /register
POST /login
POST /forget-password
POST /reset-password
```

## Home APIs

```http
GET /sliders
GET /products-bestseller
```

## Wishlist APIs

```http
GET /wishlist
POST /add-to-wishlist
POST /remove-from-wishlist
```

### Repositories used:

```dart
AuthRepo
HomeRepo
WishListRepo
```

---

# 🧠 State Management

The project uses **Flutter Bloc / Cubit** for managing UI state and API communication.

## AuthCubit
Handles:
- Login
- Register
- Forget password
- OTP verification flow
- Reset password
- Loading / success / error states

## HomeCubit
Handles:
- Fetch slider data
- Fetch best seller products
- Loading / success / error states

## WishListCubit
Handles:
- Fetch wishlist items
- Remove item from wishlist
- Cache wishlist IDs locally
- Loading / success / error states

## BookDetailsCubit
Handles:
- Add item to wishlist
- Check if item already exists in wishlist
- Update local cached wishlist IDs

---

# 💾 Local Storage

The project uses **SharedPreferences** for lightweight local persistence.

### Stored data includes:
- User token
- User info
- Wishlist item IDs

This helps with:
- Keeping user session data
- Quickly checking if a product is already in wishlist
- Reducing unnecessary UI inconsistency

---

# 🧭 Navigation

The app uses **GoRouter** for navigation between screens.

### Main routes include:

```dart
/
 /welcome
 /login
 /register
 /mainApp
 /home
 /forget-password
 /otpScreen
 /create-new-password
 /password-changed
 /book-details
 /wish-list
```

---

# 🧩 Reusable Widgets

## Core widgets

```dart
MainButton
CustomTextFormField
PasswordTextFormField
Dialogs
```

## Auth widgets

```dart
SocialAuthButton
AuthFooter
PinCodeSection
```

## Home widgets

```dart
HomeSlider
BookCard
```

## Book Details widgets

```dart
WishListIcon
```

## Loading widgets

```dart
SliderShimmer
GridShimmer
BookCardShimmer
TextShimmer
ListShimmer
```

---

# 🛠 Tech Stack

- Flutter
- Dart
- Dio
- Flutter Bloc / Cubit
- GoRouter
- SharedPreferences
- Carousel Slider
- Smooth Page Indicator
- SVG Support
- Shimmer Loading UI

---

# 🎯 Learning Goals

This project helped practice:

- Building clean UI from Figma
- Creating a complete authentication flow
- Handling API integration using Dio
- Managing state with Cubit
- Organizing code using feature-based architecture
- Parsing JSON into Dart models
- Building dynamic home screens
- Implementing wishlist functionality
- Caching data locally using SharedPreferences
- Navigating using GoRouter
- Creating reusable widgets
- Implementing shimmer loading for better UX

---

# 🚀 Current App Modules

- Splash & Welcome
- Authentication
- Home
- Book Details
- Wishlist
- Main Navigation

---

# 📌 Notes

- The app is built step by step across multiple course sessions.
- Session 20 focused on **Wishlist** and **Book Details** features.
- The architecture is designed to make it easier to add upcoming modules such as:
  - Cart
  - Profile
  - Search
  - Checkout

---

# 👨‍💻 Developed By

**Mina Adly**

Flutter trainee building scalable and clean Flutter applications with modern architecture, Cubit state management, and API integration.