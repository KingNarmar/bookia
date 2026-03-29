# 📚 Bookia — Flutter Bookstore App

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-3.x-blue)
![State%20Management](https://img.shields.io/badge/State%20Management-Cubit-purple)
![Architecture](https://img.shields.io/badge/Architecture-Feature%20Based-green)
![API](https://img.shields.io/badge/API-Dio-orange)
![Navigation](https://img.shields.io/badge/Navigation-GoRouter-red)
![Storage](https://img.shields.io/badge/Storage-SharedPreferences-yellow)

A modern **Flutter bookstore application** built as part of a Flutter learning journey, with a clean feature-based structure, backend integration, reusable widgets, and Cubit state management.

This README reflects the **current uploaded project state**, not just the previous README version.  
Compared to the older version, the project now clearly includes a dedicated **Order Details** module and route in addition to the already integrated flows for search, checkout, place order, profile editing, password update, and orders history.

---

# ✨ Current Project Highlights

## Main implemented flows

- Full authentication flow
- Dynamic home content from API
- Book details screen
- Wishlist integration
- Cart integration with quantity updates
- Checkout to place order flow
- Governorates loading from API
- Order success screen
- Orders history retrieval
- Single order details retrieval by order ID
- Search screen with API-powered results
- Edit profile with image upload
- Reset password with backend integration
- Bottom navigation based main app shell

---

# 🚀 Core Features

## 1) Authentication & Onboarding

- Splash screen
- Welcome screen
- Login
- Register
- Forget password
- OTP verification
- Create new password
- Password changed confirmation

## 2) Home & Product Discovery

- Dynamic home slider
- Best seller books section
- Reusable product cards
- Book details screen
- Search screen
- All products loading on search screen open
- Product search through backend API
- Debounced search input for smoother UX

## 3) Wishlist & Cart

- Add to wishlist
- Remove from wishlist
- Add to cart
- Remove from cart
- Update cart quantity
- Dynamic total calculation
- Cache wishlist IDs locally
- Cache cart IDs locally

## 4) Checkout, Orders & Order Details

- Checkout request before placing order
- Place order form with validation
- Governorate selection from bottom sheet
- Place order submission to backend
- Success screen after order placement
- My Orders screen connected to backend
- Order Details screen connected to backend using order ID
- Delivery address, ordered items, and payment summary display

## 5) Profile Management

- Profile overview screen
- Edit profile screen
- Update name, phone, and address
- Profile image upload
- Reset password flow
- Ready profile tiles for future extensions

---

# 🆕 What Was Updated Compared to the Previous README

The previous README already covered the Session 22 features, but the current uploaded codebase shows extra progress and clearer structure updates, including:

- Added a full **Order Details** feature module
- Added **Order Details route** in app routing
- Added backend call for **single order retrieval**
- Added dedicated UI widgets for:
  - delivery address
  - ordered items
  - payment summary
- Updated feature structure under:
  - `features/orders/my_orders`
  - `features/orders/order_details`
- Updated search location to:
  - `features/home/search`
- Current architecture is more accurate than the old README structure

---

# 📱 App Screens Preview

| Splash Screen | Welcome Screen | Login Screen |
|---|---|---|
| <img src="screen_shots/splash_screen.png" width="220"/> | <img src="screen_shots/welcome_screen.png" width="220"/> | <img src="screen_shots/Login_screen.png" width="220"/> |

| Register Screen | Forget Password Screen | OTP Verification Screen |
|---|---|---|
| <img src="screen_shots/register_screen.png" width="220"/> | <img src="screen_shots/forget_password_screen.png" width="220"/> | <img src="screen_shots/otp_verification_screen.png" width="220"/> |

| Create New Password Screen | Password Changed Screen | Home Screen |
|---|---|---|
| <img src="screen_shots/create_new_password_screen.png" width="220"/> | <img src="screen_shots/password_cahnged_screen.png" width="220"/> | <img src="screen_shots/home_screen.png" width="220"/> |

| Book Details Screen | Search Screen | Wishlist Screen |
|---|---|---|
| <img src="screen_shots/details_screen.png" width="220"/> | <img src="screen_shots/search_screen.png" width="220"/> | <img src="screen_shots/wish_list_screen.png" width="220"/> |

| Cart Screen | Place Order Screen | Order Success Screen |
|---|---|---|
| <img src="screen_shots/cart_screen.png" width="220"/> | <img src="screen_shots/place_order_screen.png" width="220"/> | <img src="screen_shots/Order_success_screen.png" width="220"/> |

| Profile Screen | Edit Profile Screen | Reset Password Screen |
|---|---|---|
| <img src="screen_shots/Profile_screen.png" width="220"/> | <img src="screen_shots/edit_profile_screen.png" width="220"/> | <img src="screen_shots/reset_password_screen.png" width="220"/> |

| My Orders Screen | Order Details Screen |  |
|---|---|---|
| <img src="screen_shots/my_orders_screen.png" width="220"/> | <img src="screen_shots/order_details_screen.png" width="220"/> |  |

---

# 🏗 Project Architecture

The project follows a **feature-based architecture** with shared core services, reusable widgets, and separated business logic.
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
    │   │   ├── data/
    │   │   └── presentation/
    │   │
    │   ├── book_details/
    │   │   └── presentation/
    │   │
    │   ├── cart/
    │   │   ├── data/
    │   │   └── presentation/
    │   │
    │   ├── home/
    │   │   ├── home/
    │   │   │   ├── data/
    │   │   │   └── presentation/
    │   │   └── search/
    │   │       ├── data/
    │   │       └── presentation/
    │   │
    │   ├── main/
    │   │
    │   ├── orders/
    │   │   ├── my_orders/
    │   │   │   ├── data/
    │   │   │   └── presentation/
    │   │   └── order_details/
    │   │       ├── data/
    │   │       └── presentation/
    │   │
    │   ├── place_order/
    │   │   ├── data/
    │   │   └── presentation/
    │   │
    │   ├── profile_folder/
    │   │   ├── profile/
    │   │   ├── edit_profile/
    │   │   └── reset_password/
    │   │
    │   ├── welcome/
    │   └── wish_list/
    │
    └── main.dart
```
## Why this structure?

- better separation between UI and business logic
- easier maintenance and debugging
- clearer ownership for each feature
- easier reuse of widgets, repos, and cubits
- smoother scalability for future modules

---

# 🧠 State Management

The project uses **Flutter Bloc / Cubit**.

## Cubits currently used

### AuthCubit
Handles:
- login
- register
- forget password
- OTP verification flow
- reset password flow

### HomeCubit
Handles:
- sliders
- best seller products
- loading and success states for home content

### BookDetailsCubit
Handles:
- add to wishlist
- add to cart
- local cache checks for wishlist/cart state

### WishListCubit
Handles:
- fetching wishlist items
- removing wishlist items
- syncing cached wishlist IDs

### CartCubit
Handles:
- fetching cart items
- removing items
- updating quantity
- calculating total
- checkout request
- syncing cached cart IDs

### PlaceOrderCubit
Handles:
- fetching governorates
- selected governorate state
- place order request flow

### MyOrderCubit
Handles:
- fetching orders history
- loading, success, empty, and error states

### OrderDetailsCubit
Handles:
- fetching single order details by order ID
- loading, success, and error states

### SearchCubit
Handles:
- loading all products on screen open
- searching products by name
- managing loading and result states

### EditProfileCubit
Handles:
- loading cached user info
- editing profile data
- image selection state
- update request state

### ResetPasswordCubit
Handles:
- update password request
- validation and request states

---

# 🔌 API Integration

The app communicates with backend services using **Dio**.

## Base URL

`https://codingarabic.online/api/`

## Authentication Endpoints

- `register`
- `login`
- `forget-password`
- `reset-password`

## Home & Catalog Endpoints

- `sliders`
- `products-bestseller`
- `products`
- `products-search`

## Wishlist Endpoints

- `wishlist`
- `add-to-wishlist`
- `remove-from-wishlist`

## Cart & Checkout Endpoints

- `cart`
- `add-to-cart`
- `remove-from-cart`
- `update-cart`
- `checkout`

## Order Endpoints

- `governorates`
- `place-order`
- `order-history`
- `order-history/{id}`

## Profile Endpoints

- `update-profile`
- `update-password`

---

# 💾 Local Storage

The app uses **SharedPreferences** for local caching.

## Cached Data

- authentication token
- user information
- wishlist product IDs
- cart product IDs

## Why caching is used

- keep the user logged in
- make local UI checks faster
- reduce repeated data checks
- improve wishlist/cart responsiveness
- preload profile data more smoothly

---

# 🧭 Navigation

The project uses **GoRouter** for navigation.

## Main routes

- Splash
- Welcome
- Login
- Register
- Forget Password
- OTP Screen
- Create New Password
- Password Changed
- Main App
- Home
- Book Details
- Wishlist
- Place Order
- Congrats / Order Success
- Profile
- Edit Profile
- Reset Password
- My Orders
- Search
- Order Details

## Main bottom navigation tabs

- Home
- Wishlist
- Cart
- Profile

---

# ⚡ UX & Loading Patterns

The app uses more than one UX/loading style depending on the screen and action.

## Implemented patterns

- shimmer loading placeholders
- dialog-based loading feedback
- snackbar-based success/error feedback
- empty states for wishlist/cart/orders
- debounced API search
- route-based screen navigation with extras
- cached state checks for faster UI response

## Loading style examples

- search requests
- profile update
- order history fetch
- order details fetch
- place order flow
- password update

---

# 🧩 Reusable Widgets & Shared UI

Examples of reusable/shared widgets used across the project:

- `MainButton`
- `CustomTextFormField`
- `PasswordTextFormField`
- `SocialAuthButton`
- `PinCodeSection`
- `BookCard`
- `HomeSlider`
- `WishListIcon`
- `CartTile`
- `ProfileTile`
- `OrderItem`
- `DeliveryAddressWidget`
- `OrderItemsWidget`
- `OrderPaymentSummaryWidget`
- shimmer widgets
- dialog helpers
- navigation helpers

These reusable widgets make the project cleaner and reduce repeated code.

---

# 🛠 Tech Stack

- Flutter
- Dart
- Dio
- Flutter Bloc / Cubit
- GoRouter
- SharedPreferences
- Flutter SVG
- Shimmer
- Carousel Slider
- Smooth Page Indicator
- Gap
- Cached Network Image
- Image Picker
- Lottie
- Pinput

---

# 📚 What This Project Covers

This project is a practical implementation of many important Flutter concepts, including:

- feature-based architecture
- Cubit state management
- API integration with Dio
- local caching with SharedPreferences
- reusable widget design
- authentication flow
- wishlist flow
- cart flow
- checkout flow
- order history flow
- single order details flow
- profile update flow
- password update flow
- product search flow
- app routing with GoRouter
- loading and feedback UX patterns

---

# ▶️ Getting Started

## Prerequisites

- Flutter SDK installed
- Android Studio or VS Code
- emulator or physical device
- internet connection for backend requests

## Run the project

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

---

# 📌 Current Module Summary

## Auth
Covers:
- login
- register
- forget password
- OTP verification
- create new password
- password changed confirmation

## Home
Covers:
- sliders
- best sellers
- product cards
- navigation to details
- search entry point

## Book Details
Covers:
- product details display
- add to wishlist
- add to cart

## Wishlist
Covers:
- fetching wishlist items
- remove from wishlist
- local wishlist sync

## Cart
Covers:
- fetch cart items
- quantity update
- remove item
- total calculation
- checkout request

## Place Order
Covers:
- governorates fetch
- order form
- submit order
- success screen

## Orders
Covers:
- orders history
- open single order
- show delivery address
- show ordered products
- show payment summary

## Profile
Covers:
- profile overview
- edit profile
- upload profile image
- update password

---

# 👨‍💻 Developed By

**Mina Adly**

Warehouse Manager and Flutter learner focused on building clean, scalable applications using modern Flutter architecture, Cubit state management, API integration, reusable components, and production-style project organization.