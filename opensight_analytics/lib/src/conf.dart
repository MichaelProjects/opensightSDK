class Config {
  final String? analytics_api;
  final String? app_id;
  final String? token;
  final String? name;
  final String? package_name;

  Config(this.analytics_api, this.app_id, this.token, this.name,
      this.package_name);

  factory Config.fromJson(Map data) {
    return Config(
      data["url"],
      data["app_id"],
      data["token"],
      data["name"],
      data["package_name"],
    );
  }
  factory Config.def() {
    return Config("localhost:28018", "123", "default", "123", "io.default");
  }
}
