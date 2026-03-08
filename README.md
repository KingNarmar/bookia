# 📚 Bookia

A Flutter bookstore application built from the provided Figma design.  
Developed as part of **Session 17 Task** in the Flutter course.

This version extends the previous authentication flow by adding the **Home module** with real backend integration for:

- Home slider banners
- Best seller products
- API integration using **Dio**
- State management using **Cubit**
- Clean feature-based architecture
- Reusable UI components
- Consistent design system

---

# ✨ What’s New in Session 17

In this task, the project was expanded beyond authentication screens to include the **Home Screen** connected to backend APIs.

## Added in this session:

- Home screen UI implementation
- Dynamic slider connected to backend
- Best seller products grid connected to backend
- `HomeCubit` for home data state management
- `HomeRepo` for handling home API requests
- `SliderModel` for slider parsing
- Product model integration for best seller books
- Reusable `BookCard` widget connected to API data
- Reusable `HomeSlider` widget using `CarouselSlider`
- Smooth page indicator for slider state

---

# 🏗 Project Structure

lib/
│
├── app_root/
│ └── app_root.dart
│
├── core/
│ ├── constants/
│ │ ├── app_fonts.dart
│ │ └── app_images.dart
│ │
│ ├── functions/
│ │ └── navigations.dart
│ │
│ ├── services/
│ │ ├── api/
│ │ │ ├── api.dart
│ │ │ └── dio_provider.dart
│ │ │
│ │ └── local/
│ │ └── shared_pref.dart
│ │
│ ├── styles/
│ │ ├── app_colors.dart
│ │ └── text_styles.dart
│ │
│ └── widgets/
│ ├── custom_text_form_field.dart
│ ├── dialogs.dart
│ ├── main_button.dart
│ └── password_text_form_field.dart
│
├── features/
│ ├── auth/
│ │ ├── data/
│ │ │ ├── models/
│ │ │ │ ├── forget_password_params.dart
│ │ │ │ ├── register_params.dart
│ │ │ │ └── reset_password_params.dart
│ │ │ │
│ │ │ └── repo/
│ │ │ └── auth_repo.dart
│ │ │
│ │ └── presentation/
│ │ ├── cubit/
│ │ │ ├── auth_cubit.dart
│ │ │ └── auth_state.dart
│ │ │
│ │ ├── functions/
│ │ │ └── app_validators.dart
│ │ │
│ │ ├── screens/
│ │ │ ├── create_new_password_screen.dart
│ │ │ ├── forget_password.dart
│ │ │ ├── login_screen.dart
│ │ │ ├── otp_verification_screen.dart
│ │ │ ├── password_changed_screen.dart
│ │ │ └── register_screen.dart
│ │ │
│ │ └── widgets/
│ │ ├── auth_footer.dart
│ │ ├── pin_code_section.dart
│ │ └── social_auth_button.dart
│
├── home/
│ ├── data/
│ │ ├── models/
│ │ │ ├── product_model/
│ │ │ │ ├── data.dart
│ │ │ │ ├── product.dart
│ │ │ │ └── product_model.dart
│ │ │ │
│ │ │ └── slider_model.dart
│ │ │
│ │ └── repo/
│ │ └── home_repo.dart
│ │
│ └── presentation/
│ ├── cubits/
│ │ └── home_cubit/
│ │ ├── home_cubit.dart
│ │ └── home_state.dart
│ │
│ ├── screens/
│ │ └── home_screen.dart
│ │
│ └── widgets/
│ ├── book_card.dart
│ └── home_slider.dart
│
├── main/
│ └── main_app_screen.dart
│
├── welcome/
│ └── screens/
│ ├── splash_screen.dart
│ └── welcome_screen.dart
│
└── main.dart

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

Features:

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

Features:

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

Features:

- Email input
- Form validation
- Connected to Forget Password API
- Loading and error handling
- Navigation to OTP screen after successful request

---

## 🟢 OTP Verification Screen

<img src="screen_shots/otp_verification_screen.png" width="300"/>

Features:

- PIN code input (OTP)
- Verification button
- Resend option UI
- OTP stored using Cubit controller
- Navigation to Create New Password screen

---

## 🟢 Create New Password Screen

<img src="screen_shots/create_new_password_screen.png" width="300"/>

Features:

- New password field
- Confirm password field
- Validation
- Connected to Reset Password API
- Uses OTP + New Password + Confirm Password
- Loading, success, and error state handling with Cubit

---

## 🟢 Password Changed Screen

<img src="screen_shots/password_cahnged_screen.png" width="300"/>

Features:

- Success state UI
- Back to Login navigation
- Clean completion of reset password flow

---

## 🟢 Home Screen

<img src="screen_shots/home_screen.png" width="300"/>

Features:

- Dynamic promotional slider from backend
- Best seller books section
- Grid layout for product cards
- API integration using Dio
- Home state handling using Cubit
- Loading and error state support
- Reusable HomeSlider and BookCard widgets
- Smooth page indicator for slider banners

---

# 🔌 API Integration

The app is connected to backend endpoints using Dio.

Implemented Authentication Endpoints:

- POST /login
- POST /register
- POST /forget-password
- POST /reset-password

Implemented Home Endpoints:

- GET /sliders
- GET /products-bestseller

API Layer Includes:

- DioProvider
- API endpoint constants
- Repository pattern
  - AuthRepo
  - HomeRepo
- Request models for API parameters
- Response model parsing for auth and home data

---

# 🧠 State Management

This project uses Flutter Bloc / Cubit for handling app states.

AuthCubit Responsibilities:

- Login handling
- Register handling
- Forget Password requests
- Reset Password requests
- TextEditingControllers management
- Form validation
- Handling loading / success / error states

HomeCubit Responsibilities:

- Fetching slider data from backend
- Fetching best seller product data
- Combining home screen requests in one flow
- Emitting loading / success / error states for the Home module

---

# 🧩 Reusable Components

Core Reusable Widgets:

- MainButton
- CustomTextFormField
- PasswordTextFormField
- Dialogs

Auth Reusable Widgets:

- SocialAuthButton
- AuthFooter
- PinCodeSection

Home Reusable Widgets:

- HomeSlider
- BookCard

---

# 🛠 Tech Stack

- Flutter
- Dart
- Flutter Bloc / Cubit
- Dio
- SVG Support
- Carousel Slider
- Smooth Page Indicator
- Reusable Custom Widgets

---

# 🚀 Learning Goals Practiced

This project was built to practice:

- Clean UI implementation from Figma
- Feature-based project structure
- Flutter form validation
- API integration with Dio
- State management with Cubit
- Repository pattern
- JSON parsing into Dart models
- Building a complete authentication flow
- Building a home screen connected to backend services

---

# 📌 Notes

This project started as a UI implementation task, then evolved into a more complete app structure by adding:

- real backend integration
- Cubit-based state management
- reusable architecture
- dynamic home content

Session 17 mainly focused on moving from static UI into dynamic home data rendering using backend APIs.
