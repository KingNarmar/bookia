# 📚 Bookia — Modern Flutter Bookstore App (Session 24)

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![State Management](https://img.shields.io/badge/State%20Management-Cubit-purple)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-green)
![Dependency Injection](https://img.shields.io/badge/DI-GetIt-orange)
![Networking](https://img.shields.io/badge/Networking-Dio-red)
![Navigation](https://img.shields.io/badge/Navigation-GoRouter-pink)
![Session](https://img.shields.io/badge/Session-24-black)
![Focus](https://img.shields.io/badge/Focus-Clean%20Architecture-critical)

**Bookia** is a modern Flutter bookstore application built with a scalable feature-based structure, backend integration, state management using **Cubit**, and a cleaner separation of concerns using **Clean Architecture** principles.

This README reflects the progress up to **Session 24**, where the main task was refactoring the project into a more maintainable and scalable architecture by separating the app into **Presentation**, **Domain**, and **Data** layers across the main business features.

---

## 🎯 Session 24 Main Task — Applying Clean Architecture

The core objective of this session was to reorganize the project so that business logic is no longer mixed directly with UI or networking code.

### ✅ What was achieved

- Refactored the project into a cleaner **feature-first Clean Architecture** structure.
- Added a dedicated **Domain Layer** for core business rules.
- Added a dedicated **Data Layer** for models, repositories, and remote data sources.
- Kept the **Presentation Layer** focused on UI, Cubits, and states.
- Introduced **Use Cases** to make each action more isolated and reusable.
- Added **Repository Contracts** in the domain layer and linked them with implementations in the data layer.
- Added **Dependency Injection** using `GetIt` to register:
  - remote data sources
  - repositories
  - use cases
  - cubits
- Preserved the improved **error handling system** from Session 23 using `Failure` and `Either<Failure, T>`.
- Reduced tight coupling between:
  - UI and API
  - Cubits and Dio
  - Features and low-level implementation details

---

## 🧱 Clean Architecture Flow

The project now follows this structure for the main business features:

    UI / Screen
       ↓
    Cubit
       ↓
    Use Case
       ↓
    Repository Contract
       ↓
    Repository Implementation
       ↓
    Remote Data Source
       ↓
    Dio Provider
       ↓
    API

### Error Handling Flow

    Dio / API
       ↓
    Failure Mapping
       ↓
    Either<Failure, T>
       ↓
    Repository
       ↓
    Use Case
       ↓
    Cubit
       ↓
    UI State

This flow helps keep the app cleaner, easier to debug, and safer to extend.

---

## 🏗 Architecture Overview

### Core Layer

The `core/` folder now provides the shared infrastructure used across the app:

- `core/di/` → dependency injection setup using `GetIt`
- `core/error/` → shared failure models
- `core/usecase/` → base use case abstraction
- `core/services/dio/` → networking layer
- `core/services/local/` → local storage with `SharedPreferences`
- `core/localization/` → Arabic and English localization
- `core/routes/` → app navigation using `GoRouter`
- `core/widgets/` → reusable shared widgets
- `core/functions/` → shared helpers and validators

### Feature Layer Pattern

Most main features now follow this structure:
```text
    feature/
    ├── data/
    │   ├── data_sources/
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── repositories/
    │   └── usecases/
    └── presentation/
        ├── cubit/
        ├── screens/
        └── widgets/
```
---

## 📂 Updated Project Structure
```text

    lib/
    ├── app_root/
    │   └── app_root.dart
    ├── core/
    │   ├── constants/
    │   ├── cubits/
    │   │   └── app_cubit/
    │   ├── di/
    │   │   └── injection_container.dart
    │   ├── error/
    │   │   └── failure.dart
    │   ├── functions/
    │   ├── localization/
    │   ├── network/
    │   ├── routes/
    │   ├── services/
    │   │   ├── dio/
    │   │   └── local/
    │   ├── styles/
    │   ├── usecase/
    │   │   └── usecase.dart
    │   └── widgets/
    ├── features/
    │   ├── auth/
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/
    │   ├── cart/
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/
    │   ├── home/
    │   │   ├── home/
    │   │   │   ├── data/
    │   │   │   ├── domain/
    │   │   │   └── presentation/
    │   │   └── search/
    │   │       ├── data/
    │   │       ├── domain/
    │   │       └── presentation/
    │   ├── orders/
    │   │   ├── my_orders/
    │   │   │   ├── data/
    │   │   │   ├── domain/
    │   │   │   └── presentation/
    │   │   └── order_details/
    │   │       ├── data/
    │   │       ├── domain/
    │   │       └── presentation/
    │   ├── place_order/
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/
    │   ├── profile_folder/
    │   │   ├── edit_profile/
    │   │   │   ├── data/
    │   │   │   ├── domain/
    │   │   │   └── presentation/
    │   │   ├── profile/
    │   │   │   └── presentation/
    │   │   └── reset_password/
    │   │       ├── data/
    │   │       ├── domain/
    │   │       └── presentation/
    │   ├── wish_list/
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/
    │   ├── book_details/
    │   │   └── presentation/
    │   ├── main/
    │   └── welcome/
    └── main.dart
```
---

## ✅ Features Refactored Using Clean Architecture

The Clean Architecture pattern is clearly applied to the project’s main business-driven features:

- **Auth**
- **Home**
- **Search**
- **Cart**
- **Wish List**
- **My Orders**
- **Order Details**
- **Place Order**
- **Edit Profile**
- **Reset Password**

### Notes

- **Book Details** currently remains presentation-focused.
- **Profile**, **Welcome**, and **Main App** are lightweight modules and remain mostly UI-focused.
- The main session goal was successfully achieved for the features that directly depend on API calls, business rules, and reusable domain logic.

---

## 📱 Screenshots Preview

### 🔹 Onboarding & Authentication

| Splash | Welcome | Login | Register |
|:---:|:---:|:---:|:---:|
| <img src="screen_shots/splash_screen.png" width="180"/> | <img src="screen_shots/welcome_screen.png" width="180"/> | <img src="screen_shots/Login_screen.png" width="180"/> | <img src="screen_shots/register_screen.png" width="180"/> |

| Forgot Password | OTP Verification | New Password | Success |
|:---:|:---:|:---:|:---:|
| <img src="screen_shots/forget_password_screen.png" width="180"/> | <img src="screen_shots/otp_verification_screen.png" width="180"/> | <img src="screen_shots/create_new_password_screen.png" width="180"/> | <img src="screen_shots/password_cahnged_screen.png" width="180"/> |

### 🔹 Home, Search & Details

| Home | Search | Book Details |
|:---:|:---:|:---:|
| <img src="screen_shots/home_screen.png" width="220"/> | <img src="screen_shots/search_screen.png" width="220"/> | <img src="screen_shots/details_screen.png" width="220"/> |

### 🔹 Wishlist, Cart & Checkout

| Wishlist | Cart | Place Order | Order Success |
|:---:|:---:|:---:|:---:|
| <img src="screen_shots/wish_list_screen.png" width="180"/> | <img src="screen_shots/cart_screen.png" width="180"/> | <img src="screen_shots/place_order_screen.png" width="180"/> | <img src="screen_shots/Order_success_screen.png" width="180"/> |

### 🔹 Profile & Orders

| Profile | Edit Profile | My Orders | Order Details |
|:---:|:---:|:---:|:---:|
| <img src="screen_shots/Profile_screen.png" width="180"/> | <img src="screen_shots/edit_profile_screen.png" width="180"/> | <img src="screen_shots/my_orders_screen.png" width="180"/> | <img src="screen_shots/order_details_screen.png" width="180"/> |

---

## 🧠 Dependency Injection

The project now uses **GetIt** as a service locator to centralize dependency registration.

### Registered dependencies include

- Remote Data Sources
- Repository Implementations
- Repository Contracts
- Use Cases
- Cubits

### Why this matters

- Cleaner initialization
- Less manual dependency passing
- Easier scalability
- Better separation between layers
- More maintainable architecture

---

## 🛡 Error Handling + Result Pattern

The project continues using the improved error handling approach introduced previously.

### Shared failure types

- `Failure`
- `ApiFailure`
- `NetworkFailure`
- `CacheFailure`
- `ParseFailure`
- `UnknownFailure`

### Result pattern

    Either<Failure, T>

This helps the app safely handle:

- API errors
- no internet connection
- server-side issues
- invalid responses
- parsing problems
- unexpected exceptions

---

## 🧩 State Management

The project uses **Cubit** for state management.

### Main Cubits

- `AppCubit`
- `AuthCubit`
- `HomeCubit`
- `SearchCubit`
- `BookDetailsCubit`
- `CartCubit`
- `WishListCubit`
- `PlaceOrderCubit`
- `MyOrderCubit`
- `OrderDetailsCubit`
- `EditProfileCubit`
- `ResetPasswordCubit`

Each Cubit is now cleaner because it communicates with **Use Cases** instead of directly calling networking code.

---

## ✨ Main App Features

### 🌍 Localization & App Setup

- Arabic and English support
- Runtime language switching
- Organized routing using `GoRouter`
- Shared global app setup through `app_root`

### 🔐 Authentication

- Login
- Register
- Forgot password
- OTP verification
- Reset password
- Password changed flow
- Logout with local cache cleanup

### 🏠 Home & Search

- Slider banners
- Best seller books
- Product search
- Load all products on search screen

### ❤️ Wishlist

- Add books to wishlist
- Remove books from wishlist
- Local cached IDs for faster UI response

### 🛒 Cart & Checkout

- Add to cart
- Remove from cart
- Update quantity
- Checkout flow integration
- Local cached cart IDs support

### 📦 Orders

- Place order
- Governorate selection
- View all orders
- View order details
- Delivery address and payment summary

### 👤 Profile

- View profile data
- Edit profile
- Update password
- Sync updated user data with local cache

---

## 📦 Why This Refactor Matters

Applying Clean Architecture in Session 24 makes the project:

- Easier to maintain
- Easier to scale
- Easier to debug
- Easier to extend
- Easier to test later
- Cleaner in responsibility separation
- More production-ready

This refactor is an important step toward building Flutter apps with a professional and scalable codebase.

---

## 🛠 Tech Stack

- **Flutter**
- **Dart**
- **Cubit / Flutter Bloc**
- **Dio**
- **Dartz**
- **GetIt**
- **GoRouter**
- **SharedPreferences**
- **Flutter SVG**
- **Cached Network Image**
- **Image Picker**
- **Carousel Slider**
- **Smooth Page Indicator**
- **Shimmer**
- **Pinput**
- **Lottie**
- **Gap**
- **Flutter Localizations**

---

## 🚀 Getting Started

    git clone https://github.com/[your-username]/bookia.git
    cd bookia
    flutter pub get
    flutter run

---

## 👨‍💻 Developed By

**Mina Adly**  
Flutter Developer

Passionate about building clean, scalable, and practical Flutter applications with modern UI and maintainable architecture.

### 📬 Contact & Collaboration

- **GitHub:** https://github.com/KingNarmar
- **LinkedIn:** https://www.linkedin.com/in/mina-bushra-733993317/
- **Email:** adlymina99@gmail.com
- **Mobile:** +971581255496 / +201555212015

---

## ⭐ Final Note

This README reflects the progress up to **Session 24**, where the project was refactored toward a more practical **Clean Architecture** setup.

The main business features now follow a much stronger architectural structure based on:

- Presentation Layer
- Domain Layer
- Data Layer

This gives the project a stronger foundation for future sessions, cleaner feature expansion, and easier long-term maintenance.