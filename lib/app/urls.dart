class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static String verifyEmailUrl(String email) => '$_baseUrl/auth/login/$email';
}
