# 📚 Bookia

A Flutter bookstore application built from the provided Figma design.  
Developed as part of the **Flutter Course Tasks (Session 15 → Session 19)**.

The project started as a **UI implementation for authentication screens**, then gradually evolved into a **fully structured Flutter application** including:

- Authentication system connected to backend APIs
- Home screen connected to real backend data
- Clean feature-based architecture
- State management using Cubit
- API integration using Dio
- Loading skeleton UI using Shimmer
- Centralized routing system
- Reusable and scalable UI components

---

# 🚀 Project Overview

Bookia is a modern Flutter bookstore application that demonstrates a **complete production-style architecture** including:

- Authentication flow
- API integration
- State management
- Clean project structure
- Dynamic home screen
- Loading skeleton UI
- Modular reusable widgets

The application fetches real data from backend services including:

- Promotional sliders
- Best seller books

---

# ✨ What's New in Session 19

Session 19 focused on improving the **architecture, user experience, and API structure**.

## Major Improvements

### 🧭 Centralized Routing System

Navigation has been refactored into a centralized routing file:

```
core/routes/routes.dart
```

Benefits:

- Clean navigation management
- Avoid duplicated navigation code
- Easier scaling for large applications
- Route name based navigation

---

### ⚡ Shimmer Loading System

A full skeleton loading system was implemented to improve the user experience while waiting for API responses.

New Shimmer Widgets:

```
core/widgets/shimmer/
 ├── book_card_shimmer.dart
 ├── grid_shimmer.dart
 ├── horizontal_list_shimmer.dart
 ├── list_shimmer.dart
 ├── slider_shimmer.dart
 ├── text_shimmer.dart
 └── shimmer_widgets.dart
```

These widgets provide **loading placeholders** for:

- Sliders
- Product cards
- Lists
- Text content
- Grid views

This creates a **modern loading experience similar to real production apps**.

---

### 🧠 Improved API Response Parsing

The API models were improved by introducing **response wrappers** instead of parsing raw maps.

Example structure:

```
SliderResponse
 └── Data
      └── Slider
```

New Models:

```
slider_response/
 ├── slider_response.dart
 ├── data.dart
 └── slider.dart
```

Benefits:

- Strong typing
- Cleaner API parsing
- Easier debugging
- Better scalability

---

### 🔐 Authentication Response Model

Authentication API responses are now parsed using dedicated models.

New Models:

```
auth_response/
 ├── auth_response.dart
 ├── data.dart
 └── user.dart
```

Benefits:

- Proper JSON parsing
- Strong typing
- Safer API handling

---

### 🧱 Feature-Based Architecture Improvements

The project structure was refined to follow a **clean feature-based architecture**.

Each feature now contains:

```
data
presentation
```

Example:

```
features/
   auth/
   home/
```

This approach makes the project:

- scalable
- maintainable
- easier to navigate

---

# 🏗 Project Structure

```
lib
│
├── app_root
│   └── app_root.dart
│
├── core
│   ├── constants
│   │   ├── app_fonts.dart
│   │   └── app_images.dart
│   │
│   ├── functions
│   │   └── navigations.dart
│   │
│   ├── routes
│   │   └── routes.dart
│   │
│   ├── services
│   │   ├── api
│   │   │   ├── api.dart
│   │   │   └── dio_provider.dart
│   │   │
│   │   └── local
│   │       └── shared_pref.dart
│   │
│   ├── styles
│   │   ├── app_colors.dart
│   │   └── text_styles.dart
│   │
│   └── widgets
│       ├── custom_text_form_field.dart
│       ├── dialogs.dart
│       ├── main_button.dart
│       ├── password_text_form_field.dart
│       │
│       └── shimmer
│           ├── book_card_shimmer.dart
│           ├── grid_shimmer.dart
│           ├── horizontal_list_shimmer.dart
│           ├── list_shimmer.dart
│           ├── slider_shimmer.dart
│           ├── text_shimmer.dart
│           └── shimmer_widgets.dart
│
├── features
│   ├── auth
│   │   ├── data
│   │   │   ├── models
│   │   │   │   ├── auth_response
│   │   │   │   │   ├── auth_response.dart
│   │   │   │   │   ├── data.dart
│   │   │   │   │   └── user.dart
│   │   │   │   │
│   │   │   │   ├── forget_password_params.dart
│   │   │   │   ├── register_params.dart
│   │   │   │   └── reset_password_params.dart
│   │   │   │
│   │   │   └── repo
│   │   │       └── auth_repo.dart
│   │   │
│   │   └── presentation
│   │       ├── cubit
│   │       │   ├── auth_cubit.dart
│   │       │   └── auth_state.dart
│   │       │
│   │       ├── functions
│   │       │   └── app_validators.dart
│   │       │
│   │       ├── screens
│   │       │   ├── create_new_password_screen.dart
│   │       │   ├── forget_password.dart
│   │       │   ├── login_screen.dart
│   │       │   ├── otp_verification_screen.dart
│   │       │   ├── password_changed_screen.dart
│   │       │   └── register_screen.dart
│   │       │
│   │       └── widgets
│   │           ├── auth_footer.dart
│   │           ├── pin_code_section.dart
│   │           └── social_auth_button.dart
│
├── home
│   ├── data
│   │   ├── models
│   │   │   ├── product_model
│   │   │   │   ├── data.dart
│   │   │   │   ├── product.dart
│   │   │   │   └── product_model.dart
│   │   │   │
│   │   │   └── slider_response
│   │   │       ├── slider_response.dart
│   │   │       ├── data.dart
│   │   │       └── slider.dart
│   │   │
│   │   └── repo
│   │       └── home_repo.dart
│   │
│   └── presentation
│       ├── cubits
│       │   └── home_cubit
│       │       ├── home_cubit.dart
│       │       └── home_state.dart
│       │
│       ├── screens
│       │   └── home_screen.dart
│       │
│       └── widgets
│           ├── book_card.dart
│           └── home_slider.dart
│
├── main
│   └── main_app_screen.dart
│
├── welcome
│   └── screens
│       ├── splash_screen.dart
│       └── welcome_screen.dart
│
└── main.dart
```

---

# 🎨 Implemented Screens

## Splash Screen

```
screen_shots/splash_screen.png
```

Displays the application logo during startup.

---

## Welcome Screen

```
screen_shots/welcome_screen.png
```

Provides entry options for login or registration.

---

## Login Screen

Features:

- Email and password input
- Password visibility toggle
- Form validation
- Social login buttons
- Backend login API integration
- Cubit state management

---

## Register Screen

Features:

- Username validation
- Email validation
- Password confirmation
- Custom reusable password field
- Backend register API integration

---

## Forgot Password Screen

Features:

- Email validation
- API request for password reset
- Loading and error states

---

## OTP Verification Screen

Features:

- OTP input field
- Verification flow
- Resend option

---

## Create New Password Screen

Features:

- Password reset form
- API integration
- Validation handling
- Success navigation

---

## Password Changed Screen

Displays confirmation after successful password reset.

---

## Home Screen

Features:

- Dynamic promotional slider
- Best seller products grid
- Backend API integration
- Cubit state management
- Loading skeleton UI
- Reusable widgets

---

# 🔌 API Integration

The application communicates with backend APIs using **Dio**.

### Authentication Endpoints

```
POST /login
POST /register
POST /forget-password
POST /reset-password
```

### Home Endpoints

```
GET /sliders
GET /products-bestseller
```

### API Layer Includes

- DioProvider
- API endpoint constants
- Repository pattern
- Request models
- Response models

Repositories:

```
AuthRepo
HomeRepo
```

---

# 🧠 State Management

This project uses **Flutter Bloc / Cubit**.

### AuthCubit Responsibilities

- Login handling
- Register requests
- Forget password
- Reset password
- Form validation
- Loading and error states

### HomeCubit Responsibilities

- Fetch slider data
- Fetch best seller books
- Manage loading states
- Emit success and error states

---

# 🧩 Reusable Components

### Core Widgets

```
MainButton
CustomTextFormField
PasswordTextFormField
Dialogs
```

### Auth Widgets

```
SocialAuthButton
AuthFooter
PinCodeSection
```

### Home Widgets

```
HomeSlider
BookCard
```

### Loading Widgets

```
SliderShimmer
GridShimmer
BookCardShimmer
TextShimmer
ListShimmer
```

---

# 🛠 Tech Stack

```
Flutter
Dart
Flutter Bloc / Cubit
Dio
SVG Support
Carousel Slider
Smooth Page Indicator
Shimmer Loading UI
Feature-based Architecture
```

---

# 🎯 Learning Goals Practiced

This project was built to practice:

- Flutter UI implementation from Figma
- Feature-based architecture
- API integration with Dio
- State management using Cubit
- Repository pattern
- JSON parsing into Dart models
- Authentication flows
- Dynamic home screen data
- Loading skeleton UI
- Clean scalable Flutter architecture

---

# 📌 Notes

The project started as a UI task for authentication screens and gradually evolved into a **complete application architecture** including:

- Backend API integration
- State management
- Dynamic home content
- Loading placeholders
- Modular architecture

Session 19 focused mainly on **improving the architecture and user experience** by introducing:

- centralized routing
- shimmer loading UI
- improved API response models
- better project scalability