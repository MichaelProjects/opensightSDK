class Config {
  final String? analytics_api;
  final String? app_id;
  final String? token;
  final String? name;
  final String? package_name;

  Config(this.analytics_api, this.token, this.app_id, this.name,
      this.package_name);

  factory Config.fromJson(Map data) {
    return Config(
      data["url"],
      data["app_id"],
      data["api_key"],
      data["name"],
      data["package_name"],
    );
  }
  factory Config.def() {
    return Config("0.0.0.0", "123", "default", "123", "io.default");
  }
}
