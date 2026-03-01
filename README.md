# 📚 Bookia

A Flutter authentication flow implementation based on the provided Figma design.  
Developed as part of **Session 15 Task** in the Flutter course.

This project focuses on:
- Clean folder structure (Feature-based architecture)
- Reusable UI components
- Form validation
- Custom widgets
- OTP verification flow
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
│   ├── styles/
│   └── widgets/
│
├── features/
│   ├── auth/
│   │   ├── functions/
│   │   ├── screens/
│   │   └── widgets/
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

<img src="screenshots/splash_screen.png" width="300"/>

---

## 🟢 Welcome Screen

<img src="screenshots/welcome_screen.png" width="300"/>

---

## 🟢 Login Screen

<img src="screenshots/login_screen.png" width="300"/>

**Features:**
- Email & Password fields
- Password visibility toggle
- Form validation
- Social authentication buttons
- Navigation to Register / Forgot Password

---

## 🟢 Register Screen

<img src="screenshots/register_screen.png" width="300"/>

**Features:**
- Username validation
- Email validation
- Password & Confirm Password
- Custom reusable password field
- Form validation handling

---

## 🟢 Forgot Password Screen

<img src="screenshots/forget_password_screen.png" width="300"/>

**Features:**
- Email input
- Send verification code

---

## 🟢 OTP Verification Screen

<img src="screenshots/otp_verification_screen.png" width="300"/>

**Features:**
- PIN code input (OTP)
- Verification button
- Resend option

---

## 🟢 Create New Password Screen

<img src="screenshots/create_new_password_screen.png" width="300"/>

**Features:**
- New password field
- Confirm password field
- Validation
- Reset password action

---

## 🟢 Password Changed Screen

<img src="screenshots/password_changed_screen.png" width="300"/>

**Features:**
- Success state UI
- Back to Login navigation

---

# 🧩 Reusable Components

- `MainButton`
- `CustomTextFormField`
- `PasswordTextFormField`
- `SocialAuthButton`
- `AuthFooter`
- `PinCodeSection`