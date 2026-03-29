import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'order_now': 'Order Your Book Now!',
      'login': 'Login',
      'register': 'Register',
      'welcome_back': 'Welcome back! Glad to see you, Again!',
      'email_hint': 'Enter your email',
      'password_hint': 'Enter Your Password',
      'forgot_password': 'Forgot Password?',
      'or': 'Or',
      'google_auth': 'Sign in with Google',
      'apple_auth': 'Sign in with Apple',
      'no_account': 'Don’t have an account?',
      'register_now': 'Register Now',
      'hello': 'Hello! Register to get started',
      'username_hint': 'Username',
      'confirm_password': 'Confirm password',
      'already_have_account': 'Already have an account?',
      'login_now': 'Login Now',
      'best_seller': 'Best Seller',
      'search_hint': 'Search...',
      'profile': 'Profile',
      'cart': 'Cart',
      'wishlist': 'Wishlist',
      'home': 'Home',
      'edit_profile': 'Edit Profile',
      'my_orders': 'My Orders',
      'reset_password': 'Reset Password',
      'faq': 'FAQ',
      'contact_us': 'Contact Us',
      'privacy_terms': 'Privacy & Terms',
      'logout': 'Logout',
      'fullname': 'Full Name',
      'phone': 'Phone',
      'address': 'Address',
      'save': 'Save Changes',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'confirm': 'Confirm',
    },
    'ar': {
      'order_now': 'اطلب كتابك الآن!',
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
      'welcome_back': 'أهلاً بك مجدداً! يسعدنا رؤيتك مرة أخرى!',
      'email_hint': 'أدخل البريد الإلكتروني',
      'password_hint': 'أدخل كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'or': 'أو',
      'google_auth': 'تسجيل الدخول بواسطة جوجل',
      'apple_auth': 'تسجيل الدخول بواسطة أبل',
      'no_account': 'ليس لديك حساب؟',
      'register_now': 'سجل الآن',
      'hello': 'مرحباً! أنشئ حساباً للبدء',
      'username_hint': 'اسم المستخدم',
      'confirm_password': 'تأكيد كلمة المرور',
      'already_have_account': 'لديك حساب بالفعل؟',
      'login_now': 'سجل دخولك الآن',
      'best_seller': 'الأكثر مبيعاً',
      'search_hint': 'بحث...',
      'profile': 'الملف الشخصي',
      'cart': 'السلة',
      'wishlist': 'قائمة الأمنيات',
      'home': 'الرئيسية',
      'edit_profile': 'تعديل الملف الشخصي',
      'my_orders': 'طلباتي',
      'reset_password': 'إعادة تعيين كلمة المرور',
      'faq': 'الأسئلة الشائعة',
      'contact_us': 'اتصل بنا',
      'privacy_terms': 'الخصوصية والشروط',
      'logout': 'تسجيل الخروج',
      'fullname': 'الاسم الكامل',
      'phone': 'رقم الهاتف',
      'address': 'العنوان',
      'save': 'حفظ التغييرات',
      'cancel': 'إلغاء',
      'delete': 'حذف',
      'confirm': 'تأكيد',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

extension LocalizationExtension on BuildContext {
  String translate(String key) {
    return AppLocalizations.of(this)?.translate(key) ?? key;
  }
}
