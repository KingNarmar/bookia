# 📚 Bookia

A Flutter authentication flow implementation based on the provided Figma design.  
Developed as part of **Session 16 Task** in the Flutter course.

This project focuses on:

- Clean folder structure (**Feature-based architecture**)
- Reusable UI components
- Form validation
- Custom widgets
- API integration using **Dio**
- State management using **Cubit**
- OTP verification flow
- Reset password flow connected to backend
- Consistent design system

---

# 🏗 Project Structure

```text
lib/
│
├── app_root/
│   └── app_root.dart
│
├── core/
│   ├── constants/
│   ├── functions/
│   ├── services/
│   ├── styles/
│   └── widgets/
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   └── repo/
│   │   │
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   ├── functions/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │
│   ├── home/
│   │   └── screens/
│   │
│   └── welcome/
│       └── screens/
│
└── main.dart
```

---

# 🎨 Implemented Screens

## 🟢 Splash Screen

<img src="screen_shots/splash_screen.png" width="300"/>

---

## 🟢 Welcome Screen

<img src="screen_shots/welcome_screen.png" width="300"/>

---

## 🟢 Login Screen

<img src="screen_shots/Login_screen.png" width="300"/>

**Features:**

- Email & Password fields
- Password visibility toggle
- Form validation
- Social authentication buttons
- Connected to backend login endpoint
- State handling using Cubit
- Navigation to Register / Forgot Password

---

## 🟢 Register Screen

<img src="screen_shots/register_screen.png" width="300"/>

**Features:**

- Username validation
- Email validation
- Password & Confirm Password
- Custom reusable password field
- Form validation handling
- Connected to backend register endpoint
- State handling using Cubit

---

## 🟢 Forgot Password Screen

<img src="screen_shots/forget_password_screen.png" width="300"/>

**Features:**

- Email input
- Form validation
- Connected to **Forget Password API**
- Loading and error handling
- Navigation to OTP screen after successful request

---

## 🟢 OTP Verification Screen

<img src="screen_shots/otp_verification_screen.png" width="300"/>

**Features:**

- PIN code input (OTP)
- Verification button
- Resend option UI
- OTP stored using Cubit controller
- Navigation to Create New Password screen

---

## 🟢 Create New Password Screen

<img src="screen_shots/create_new_password_screen.png" width="300"/>

**Features:**

- New password field
- Confirm password field
- Validation
- Connected to **Reset Password API**
- Uses OTP + New Password + Confirm Password
- Loading, success, and error state handling with Cubit

---

## 🟢 Password Changed Screen

<img src="screen_shots/password_cahnged_screen.png" width="300"/>

**Features:**

- Success state UI
- Back to Login navigation
- Clean completion of reset password flow

---

# 🔌 API Integration

The authentication flow is connected to backend endpoints using **Dio**.

## Implemented Endpoints

- `POST /login`
- `POST /register`
- `POST /forget-password`
- `POST /reset-password`

## API Layer Includes

- `DioProvider`
- API endpoint constants
- Repository pattern in `AuthRepo`
- Request models for API parameters
- Response model parsing

---

# 🧠 State Management

This project uses **Flutter Bloc / Cubit** for handling authentication states.

## AuthCubit Responsibilities

- Login handling
- Register handling
- Forget Password requests
- Reset Password requests
- TextEditingControllers management
- Form validation
- Handling loading / success / error states

---

# 🧩 Reusable Components

- `MainButton`
- `CustomTextFormField`
- `PasswordTextFormField`
- `SocialAuthButton`
- `AuthFooter`
- `PinCodeSection`

---

# ✅ Improvements Added in This Task

Compared to the initial UI-only implementation, the following improvements were introduced:

- Connected authentication screens to real backend APIs
- Added Dio-based API service layer
- Implemented repository pattern for authentication requests
- Created request models such as:
  - `ForgetPasswordParams`
  - `ResetPasswordParams`
- Added Cubit methods for:
  - `login()`
  - `register()`
  - `forgetPassword()`
  - `resetPassword()`
- Passed data across reset password flow screens using the same Cubit instance
- Implemented loading dialogs and error dialogs
- Completed the full password reset flow from email submission to success confirmation screen

---

# 🛠 Tech Stack

- Flutter
- Dart
- Flutter Bloc / Cubit
- Dio
- SVG Support
- Reusable Custom Widgets

---

# 🚀 Notes

This project was built to practice:

- Clean UI implementation from Figma
- Feature-based project structure
- Flutter form validation
- API integration
- State management with Cubit
- Building a complete authentication flow connected to backend services