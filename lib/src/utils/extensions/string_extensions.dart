extension StringExtensions on String {
  bool get isValidIpPort {
    if (ipPortRegex.hasMatch(this)) {
      final port = int.tryParse(split(':')[1]);
      return port != null && port >= 1 && port <= 65535;
    }
    return false;
  }

  bool get isValidIp => ipRegex.hasMatch(this);

  DateTime? get toDate {
    try {
      return DateTime(
        int.parse(substring(0, 4)),
        int.parse(substring(4, 6)),
        int.parse(substring(6, 8)),
      );
    } catch (e) {
      return null;
    }
  }
}

final ipRegex = RegExp(
  r'^((25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)$',
);

final ipPortRegex = RegExp(
  r'^((25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?):(\d+)$',
);
