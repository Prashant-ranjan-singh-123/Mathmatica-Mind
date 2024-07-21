import 'package:get/get.dart';
import 'package:mathmatics_mind/Data/app_assets.dart';

class AboutUsScreenData {
  late final AppAssets appAssets;
  late final Map<int, List<String>> socialLinks;
  late final Map<int, List<dynamic>> skills;

  AboutUsScreenData() {
    appAssets = Get.find<AppAssets>();
    _initializeMaps();
  }

  void _initializeMaps() {
    socialLinks = {
      0: [appAssets.threeisToFourPortfolioImage, 'https://prashant-ranjan-singh-123.github.io/'],
      1: [appAssets.threeisToFourGithubImage, 'https://github.com/Prashant-ranjan-singh-123'],
      2: [appAssets.threeisToFourLinkedinImage, 'https://www.linkedin.com/in/prashant-ranjan-singh-b9b6b9217/'],
      3: [appAssets.threeisToFourTelegramImage, 'https://t.me/Prashantsingh255'],
      4: [appAssets.threeisToFourGmailImage, 'prashant.singh.12312345@gmail.com']
    };

    skills = {
      0: ['Flutter', 0.9],
      1: ['Dart', 0.82],
      2: ['Firebase', 0.75],
      3: ['Android Development', 0.7],
      4: ['Supabase', 0.65],
      5: ['UI/UX', 0.46],
      6: ['SwiftUI', 0.3]
    };
  }

  static void educationFunCall() {}

  // About me
  static const String name = 'Mathmatica Mind';
  static const String role = 'Mobile Developer | Flutter Developer';
  static const String descriptionShort =
      "Hey there, fellow math enthusiast! I\'m Prashant Ranjan Singh, the developer behind this mathematical adventure you're enjoying, I've poured my passion for both math and coding into creating this app. I've utilized cutting-edge technologies Flutter with modern ui design to bring you an efficient and user-friendly experience. But here's the exciting part: this project is open-source! If you're loving the game and want to be part of its evolution, I invite you to check out our GitHub repository. Whether you're a seasoned developer or just starting out, your ideas and contributions can help make this app even more awesome. Let's collaborate and take this mathematical journey to new heights together!";
  static const String mitLicense =
      "Copyright (c) 2024 Prashant Ranjan Singh\n\n"
      "Permission is hereby granted, free of charge, to any person obtaining a copy "
      "of this software and associated documentation files (the \"Software\"), to deal "
      "in the Software without restriction, including without limitation the rights "
      "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell "
      "copies of the Software, and to permit persons to whom the Software is "
      "furnished to do so, subject to the following conditions:\n\n"
      "The above copyright notice and this permission notice shall be included in all "
      "copies or substantial portions of the Software.\n\n"
      "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR "
      "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, "
      "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE "
      "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER "
      "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, "
      "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE "
      "SOFTWARE.";

  static const String contactDescription =
      'Hey! I appreciate you looking at my public profile. Please feel free to ask me anything or to discuss anything with me. I\'m happy to chat with and meet new people. Regardless of the fact that I don\'t use social media much, you can find me there. So find me and get in touch with me. Send me an email if you need to discuss anything serious with me. I\'ll get back to you in 12 to 24 hours.';
}