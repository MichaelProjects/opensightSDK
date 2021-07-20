import "dart:math";

class Auth {
  String sessionId;
  String token;

  Auth(generateSessionId(), generateToken());

  String generateToken() {}
  String generateSessionId() {
    var timestamp = DateTime.now();

    var random = Random();
    var randomNumber = random.nextInt(10000000000000);
    int a = randomNumber + timestamp.second;
    return a.toString();
  }
}
