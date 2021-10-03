class Session {
  DateTime takenTime = DateTime.now();
  int length = 0;

  Session(int length);

  void startTracking() {}

  void increaseLength() {
    length += 10;
  }

  Map toJson() {
    return {
      "takenTime": takenTime,
      "length": length,
    };
  }
}
