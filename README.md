# 📚 Bookia - Flutter E-Commerce App

**Bookia** is a modern and fully functional e-commerce application for books, built entirely with **Flutter** and **Dart**. The project features a clean architecture, robust state management using **Bloc**, and a seamless user experience ranging from authentication down to checkout and order tracking!

## 🚀 Features

- **🔐 Authentication**: Full auth flow including Login, Register, Forgot Password, and OTP verification utilizing strict validation.
- **👤 Profile Management**: View and edit user profile details, upload profile images securely, and handle user preferences.
- **🏠 Home Dashboard**: Browse latest books and categories smoothly with carousels and dynamic skeleton loading screens.
- **📖 Book Details**: Comprehensive view of books, related images, prices, and descriptions.
- **❤️ Wishlist**: Save favorite books to purchase them later.
- **🛒 Shopping Cart**: Add/remove products and instantly review your cart summary.
- **💳 Checkout & Orders**: Streamlined placement of orders, calculating sub-totals, system discounts, and viewing your entire order history with detailed summaries.
- **🎨 Modern UI**: Custom theming, smooth animations, precise spacing, sharp SVG assets, and dynamic network image handling ensure a premium feel.

## 🛠️ Tech Stack & Packages Used

| Tech / Package | Purpose |
| -------------- | ------- |
| **Flutter/Dart** | Core SDK and Programming Language |
| **flutter_bloc** | Robust State Management (Cubit approach) |
| **dio** | Efficient Networking and API integration logic |
| **go_router** | Declarative navigation routing and deep-linking |
| **shared_preferences** | Local device storage for maintaining user sessions |
| **image_picker** | Hardware integrations to select camera and gallery images |
| **shimmer** | Advanced skeleton loaders for progressive content loading during API calls |
| **lottie** | High-quality, interactive, native app animations |
| **cached_network_image** | Intelligent web image caching and placeholder delivery |
| **pinput** | Dedicated pin code inputs logic for user OTP evaluations |
| **carousel_slider** | Interactive image/card sliding components |

## 📂 Project Architecture

The application strictly enforces a scalable, **feature-first** modular folder structure:
- **`lib/features/`**: Contains fully isolated and independent application features:
  - `auth/` (Login, Register, Password Recovery logic)
  - `home/` (Main dashboard and broad browsing options)
  - `book_details/` (Isolated specific product overview logic)
  - `cart/` (Shopping cart orchestration and totals)
  - `place_order/` (Shipping & Checkout pipeline logic)
  - `orders/` (Historic tracking and order detail receipts)
  - `profile_folder/` (Personalized user data handling and mutability)
  - `wish_list/` (Favorite products saved view state)
  - `welcome/` (Start pages and generic Onboarding flows)
- **`lib/core/`**: Central hub holding purely reusable architecture: UI styling (Colors, Text Styles), general widgets (Interactive Dialogs, Buttons), layout configuration, and underlying network API abstractions.

## 📱 Screenshots

*(Add screenshot images demonstrating the app screens like Home, Auth, Orders, etc., before publishing so employers and collaborators get a sneak peek!)*

| Home Screen | Book Details | My Orders | Edit Profile |
|--------|--------------|-----------|--------------|
| <img src="screenshots/home.png" width="200"> | <img src="screenshots/details.png" width="200"> | <img src="screenshots/orders.png" width="200"> | <img src="screenshots/profile.png" width="200"> |

## 💻 Getting Started

### Prerequisites
- Install [Flutter SDK](https://flutter.dev/docs/get-started/install) (v3.10.8 or later)
- Setup an IDE (VS Code / Android Studio)

### Installation Guide

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/bookia.git
   ```
2. Navigate to the project directory:
   ```bash
   cd bookia
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 🤝 Contributing

Contributions, issues, and feature requests are very welcome! Feel free to check the [issues page](https://github.com/your-username/bookia/issues). 

## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.

---
**Developed with ❤️ by Mina**
