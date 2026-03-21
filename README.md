# 📚 Bookia — Flutter Bookstore App

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![State Management](https://img.shields.io/badge/State%20Management-Cubit-purple)
![Architecture](https://img.shields.io/badge/Architecture-Feature%20Based-green)
![API](https://img.shields.io/badge/API-Dio-orange)
![Navigation](https://img.shields.io/badge/Navigation-GoRouter-red)
![Storage](https://img.shields.io/badge/Local%20Storage-SharedPreferences-yellow)

A modern **Flutter bookstore application** built as part of the Flutter course sessions.  
This version reflects the progress of the project up to **Session 21**.

The app demonstrates how to build a **production-style Flutter application** with:

- Authentication flow
- API integration using Dio
- State management using Cubit
- Feature-based architecture
- Reusable widgets
- Dynamic home screen
- Wishlist functionality
- Book details screen
- Cart system
- Checkout flow
- Profile module
- SharedPreferences local caching
- GoRouter navigation
- Shimmer loading states

---

# ✨ What Was Added in Session 21

In **Session 21**, the project was extended beyond the previous authentication, home, and wishlist flows by adding new e-commerce and profile-related modules.

### Added in this session:
- Cart screen
- Quantity control inside cart items
- Dynamic total price calculation
- Remove item from cart
- Place order screen
- Order success screen
- Profile screen
- Edit profile screen
- Reset password screen
- My orders screen
- Cart IDs local caching using `SharedPreferences`
- Extended main navigation flow

---

# 📱 App Screens Preview

## Splash Screen

<img src="screen_shots/splash_screen.png" width="300"/>

### Features:
- App starting screen
- Branding presentation
- Entry point into the app flow

---

## Welcome Screen

<img src="screen_shots/welcome_screen.png" width="300"/>

### Features:
- Intro screen for users
- Navigation to Login
- Navigation to Register
- Clean onboarding layout

---

## Login Screen

<img src="screen_shots/login_screen.png" width="300"/>

### Features:
- Email and password fields
- Password visibility toggle
- Form validation
- Social login buttons UI
- Connected to backend login API
- Managed using Cubit states

---

## Register Screen

<img src="screen_shots/register_screen.png" width="300"/>

### Features:
- Full registration form
- Input validation
- Confirm password field
- Reusable custom form fields
- Connected to backend register API

---

## Forget Password Screen

<img src="screen_shots/forget_password_screen.png" width="300"/>

### Features:
- Email input
- Validation handling
- Connected to forget password API
- Navigation to OTP verification screen

---

## OTP Verification Screen

<img src="screen_shots/otp_verification_screen.png" width="300"/>

### Features:
- OTP code input
- Verification flow
- Resend code action
- Navigation to create new password screen

---

## Create New Password Screen

<img src="screen_shots/create_new_password_screen.png" width="300"/>

### Features:
- New password field
- Confirm password field
- Input validation
- Password reset continuation flow

---

## Password Changed Screen

<img src="screen_shots/password_cahnged_screen.png" width="300"/>

### Features:
- Success confirmation UI
- Indicates password update completion
- Navigation back to login flow

---

## Home Screen

<img src="screen_shots/home_screen.png" width="300"/>

### Features:
- Dynamic promotional slider
- Best seller books section
- API integration using Dio
- Cubit state management
- Reusable book cards
- Shimmer loading placeholders
- Navigation to book details screen

---

## Book Details Screen

<img src="screen_shots/details_screen.png" width="300"/>

### Features:
- Book image preview
- Book title and category
- Description section
- Add to wishlist action
- Add to cart action
- Price display
- Bottom action bar
- Hero-style product transition feel

---

## Wishlist Screen

<img src="screen_shots/wish_list_screen.png" width="300"/>

### Features:
- Shows wishlist items
- Remove item from wishlist
- Empty state support
- Loading shimmer while fetching data
- Integrated with main app navigation

---

## Cart Screen

<img src="screen_shots/cart_screen.png" width="300"/>

### Features:
- Displays cart items
- Increase item quantity
- Decrease item quantity
- Remove item from cart
- Dynamic total price calculation
- Checkout button
- Local cart interaction support

---

## Place Order Screen

<img src="screen_shots/place_order_screen.png" width="300"/>

### Features:
- Checkout form UI
- Full name field
- Email field
- Address field
- Phone field
- Dropdown field
- Continue order flow action

---

## Order Success Screen

<img src="screen_shots/Order_success_screen.png" width="300"/>

### Features:
- Order success confirmation UI
- Success feedback message
- Continue shopping / back to app action

---

## Profile Screen

<img src="screen_shots/Profile_screen.png" width="300"/>

### Features:
- User profile summary section
- Navigation to profile-related options
- My Orders shortcut
- Edit Profile shortcut
- Reset Password shortcut
- FAQ / Contact / Privacy style options
- Logout UI action

---

## Edit Profile Screen

<img src="screen_shots/edit_profile_screen.png" width="300"/>

### Features:
- Edit profile image section
- Full name field
- Phone field
- Address field
- Update button

---

## Reset Password Screen

<img src="screen_shots/reset_password_screen.png" width="300"/>

### Features:
- Current password field
- New password field
- Confirm password field
- Password update UI flow

---

## My Orders Screen

<img src="screen_shots/my_orders_screen.png" width="300"/>

### Features:
- Orders list UI
- Order number display
- Order date display
- Total amount display
- Reusable order item design

---

# 🏗 Project Architecture

The project follows a **Feature-Based Architecture** to keep the code organized, scalable, and maintainable.

```text
lib/
├── app_root/
│   └── app_root.dart
│
├── core/
│   ├── constants/
│   ├── functions/
│   ├── routes/
│   ├── services/
│   │   ├── api/
│   │   └── local/
│   ├── styles/
│   └── widgets/
│       └── shimmer/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── book_details/
│   ├── wish_list/
│   ├── cart/
│   ├── place_order/
│   ├── profile/
│   ├── edit_profile/
│   ├── reset_password/
│   ├── my_orders/
│   ├── main/
│   └── welcome/
│
└── main.dart
```

### Why this structure?
- Better separation of features
- Easier maintenance
- Cleaner code organization
- Better scalability for future sessions
- More reusable logic and UI components

---

# 🔌 API Integration

The app communicates with backend services using **Dio**.

## Authentication APIs
- Register
- Login
- Forget Password
- Reset Password

## Home APIs
- Sliders endpoint
- Best seller products endpoint

## Wishlist APIs
- Get wishlist items
- Add item to wishlist
- Remove item from wishlist

## Cart APIs
- Get cart items
- Add item to cart
- Remove item from cart

---

# 🧠 State Management

The project uses **Flutter Bloc / Cubit** for state management.

## Cubits used in the project include:

### AuthCubit
Handles:
- Login
- Register
- Forget password
- OTP verification
- Reset password flow
- Loading / success / error states

### HomeCubit
Handles:
- Fetching sliders
- Fetching best seller books
- Loading / success / error states

### WishListCubit
Handles:
- Fetching wishlist items
- Removing wishlist items
- Updating local cached wishlist IDs

### BookDetailsCubit
Handles:
- Add to wishlist
- Add to cart
- Check item existence in local cache
- Sync local IDs with UI state

### CartCubit
Handles:
- Fetching cart items
- Removing cart items
- Quantity changes in UI
- Total cart price calculation
- Local cart IDs caching

---

# 💾 Local Storage

The app uses **SharedPreferences** for lightweight local persistence.

## Cached data includes:
- User token
- User information
- Wishlist item IDs
- Cart item IDs

### Benefits:
- Keeps user session available
- Supports quick wishlist/cart checks
- Reduces unnecessary repeated checks
- Helps preserve state consistency across screens

---

# 🧭 Navigation

The app uses **GoRouter** for navigation.

## Main routes include:
- Splash
- Welcome
- Login
- Register
- Forget Password
- OTP Verification
- Create New Password
- Password Changed
- Main App Screen
- Home
- Book Details
- Wishlist
- Cart
- Place Order
- Order Success
- Profile
- Edit Profile
- Reset Password
- My Orders

---

# ⚡ Shimmer Loading

To improve the user experience while waiting for API responses, the project uses shimmer loading widgets.

## Examples:
- Slider shimmer
- Grid shimmer
- Book card shimmer
- List shimmer
- Text shimmer

These placeholders make the UI feel smoother and more responsive while data is loading.

---

# 🧩 Reusable Widgets

The project includes reusable widgets across multiple modules.

## Examples:
- Main button
- Custom text form field
- Password text field
- Social auth button
- OTP / PIN code widgets
- Home slider
- Book card
- Wishlist icon
- Cart tile
- Profile tile
- Order item
- Custom dropdown form field

Using reusable widgets keeps the code cleaner and easier to maintain.

---

# 🛠 Tech Stack

- Flutter
- Dart
- Dio
- Flutter Bloc / Cubit
- GoRouter
- SharedPreferences
- Flutter SVG
- Carousel Slider
- Smooth Page Indicator
- Shimmer
- Gap

---

# 🎯 Learning Outcomes

Through this project, the following concepts were practiced:

- Building UI from Figma design
- Creating a complete authentication flow
- Connecting Flutter app with backend APIs
- Working with Dio for HTTP requests
- Managing UI state with Cubit
- Structuring app using feature-based architecture
- Creating reusable widgets
- Handling wishlist flow
- Handling cart flow
- Using SharedPreferences for local caching
- Navigating with GoRouter
- Showing shimmer loading states
- Organizing a multi-screen e-commerce app

---

# 🚀 Current App Modules

- Splash
- Welcome
- Authentication
- Home
- Book Details
- Wishlist
- Cart
- Place Order
- Order Success
- Profile
- Edit Profile
- Reset Password
- My Orders
- Main Navigation

---

# 📌 Session Summary

### Session 15 → Session 20 included:
- Authentication flow
- API integration basics
- Home screen
- Slider
- Best seller products
- Wishlist
- Book details

### Session 21 added:
- Cart system
- Quantity controls
- Total price calculation
- Place order flow
- Order success screen
- Profile module
- Edit profile screen
- Reset password screen
- My orders screen
- SharedPreferences support for cart IDs

---

# 👨‍💻 Developed By

**Mina Adly**

Flutter trainee focused on building clean, scalable Flutter applications using modern architecture, Cubit state management, API integration, and reusable UI components.