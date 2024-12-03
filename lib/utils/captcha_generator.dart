
// Function to generate a random alphanumeric CAPTCHA text
import 'dart:math';

String generateCaptchaText(int length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return List.generate(length, (index) => characters[random.nextInt(characters.length)]).join();
}