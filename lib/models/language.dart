class Language {
  static String translator(String s, String languageCode) {
    if (languageCode == "en") {
      return s;
    } else if (languageCode == "hi") {
      if (hi[s] == null) {
        return s;
      } else {
        return hi[s];
      }
    } else if (languageCode == "bn") {
      if (bn[s] == null) {
        return s;
      } else {
        return bn[s];
      }
    } else {
      return s;
    }
  }

  static Map<String, dynamic> hi = {
    "Enter your name": "अपना नाम दर्ज करें",
    "Enter your phone number": "अपना फ़ोन नंबर दर्ज करें",
    "Generate OTP": "OTP प्राप्त करे",
    "Enter your OTP": "OTP दर्ज करें",
    "Rice": "चावल"
  };

  static Map<String, dynamic> bn = {
    "Enter your name": "আপনার নাম দিন",
    "Enter your phone number": "আপনার ফোন নম্বর লিখুন",
    "Generate OTP": "OTP পান",
    "Enter your OTP": "আপনার OTP লিখুন",
    "Rice": "ভাত"
  };
}
