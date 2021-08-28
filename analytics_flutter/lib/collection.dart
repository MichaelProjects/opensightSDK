class Collection {
  String sessionId;
  String os;
  String deviceSize;
  final DateTime collectedTime = DateTime.now();

  Collection(
      {required this.sessionId, required this.os, required this.deviceSize});

  factory Collection.collect() {
    return Collection(sessionId: "");
  }
}
