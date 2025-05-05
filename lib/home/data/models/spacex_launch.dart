class SpaceXLaunch {
  final String name;
  final String dateUtc;
  final bool success;
  final String details;
  final String imageUrl;

  SpaceXLaunch(
      {required this.name,
      required this.dateUtc,
      required this.success,
      required this.details,
      required this.imageUrl});

  factory SpaceXLaunch.fromJson(Map<String, dynamic> json) {
    return SpaceXLaunch(
      name: json['name'],
      dateUtc: json['date_utc'],
      success: json['success'] ?? false,
      details: json['details'] ?? 'No details available.',
      imageUrl: json['links']['patch']['small'] ?? '',
    );
  }
}
