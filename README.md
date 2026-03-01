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

---

## 🟢 Forgot Password Screen

<img src="screen_shots/forget_password_screen.png" width="300"/>

**Features:**

- Email input
- Send verification code

---

## 🟢 OTP Verification Screen

<img src="screen_shots/otp_verification_screen.png" width="300"/>

**Features:**

- PIN code input (OTP)
- Verification button
- Resend option

---

## 🟢 Create New Password Screen

<img src="screen_shots/create_new_password_screen.png" width="300"/>

**Features:**

- New password field
- Confirm password field
- Validation
- Reset password action

---

## 🟢 Password Changed Screen

<img src="screen_shots/password_cahnged_screen.png" width="300"/>

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
