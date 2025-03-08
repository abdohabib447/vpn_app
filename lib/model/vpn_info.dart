class VpnInfo {
  late final String hostName;
  late final int ip;
  late final int ping;
  late final int speed;
  late final String countryLongName;
  late final String countryShortName;
  late final int vpnSessionNum;
  late final String based64VpnConfigurationData;

  VpnInfo({
    required this.hostName,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.countryLongName,
    required this.countryShortName,
    required this.vpnSessionNum,
    required this.based64VpnConfigurationData,
  });
  VpnInfo.fromJason(Map<String , dynamic> jasonData){
    hostName = jasonData['HostName'] ?? " ";
    ip = jasonData['IP'] ?? 0;
    ping = jasonData['Ping'] ?? 0;
    speed = jasonData['Speed'] ?? 0;
    countryLongName = jasonData['CountryLong'] ?? " ";
    countryShortName = jasonData['CountryShort'] ?? " ";
    vpnSessionNum = jasonData['NumVpnSessions'] ?? 0;
    based64VpnConfigurationData = jasonData['OpenVPN_ConfigData_Base64'] ?? " ";
  }
  Map<String , dynamic> toJason(){
    final Map<String , dynamic> jasonData = {};
    jasonData['HostName'] = hostName ;
    jasonData['IP'] = ip;
    jasonData['Ping'] = ping;
    jasonData['Speed'] = speed;
    jasonData['CountryLong'] = countryLongName;
    jasonData['CountryShort'] = countryShortName;
    jasonData['NumVpnSessions'] = vpnSessionNum;
    jasonData['OpenVPN_ConfigData_Base64'] = based64VpnConfigurationData;
    return jasonData;
  }
}
