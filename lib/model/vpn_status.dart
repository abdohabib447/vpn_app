class VpnStatus {
  String? byteIn;
  String? byteOut;
  String? duration;
  String? lastPackageReceived;
  VpnStatus({
    this.byteIn,
    this.byteOut,
    this.duration,
    this.lastPackageReceived,
  });
  factory VpnStatus.fromJson(Map<String, dynamic> jsonData) => VpnStatus(
      byteIn: jsonData["byte_in"],
      byteOut: jsonData["byte_out"],
      duration: jsonData["duration"],
      lastPackageReceived: jsonData["last_package_receive"]);
  Map<String, dynamic> toJson() => {
        "byte_in": byteIn,
        "byte_out": byteOut,
        "duration": duration,
        "last_package_receive": lastPackageReceived
      };
}
