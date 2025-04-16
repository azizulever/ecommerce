class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static String verifyEmailUrl = '$_baseUrl/auth/login';
  static String verifyOtpUrl(String email, String otp) =>
      '$_baseUrl/auth/verify-otp';
}
