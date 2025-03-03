class LaundryItem {
  final String title;
  final String price;
  final String description;
  final double imageSize;
  final Service service;

  LaundryItem({
    required this.title,
    required this.price,
    required this.description,
    required this.imageSize,
    required this.service,
  });

  String get categoryName => service.name.replaceAll("_", " ");

  String get image {
    switch (service) {
      case Service.beddings:
        return 'assets/images/duvet.png';

      case Service.iron:
        return 'assets/images/iron.png';
      case Service.wash:
        return 'assets/images/box.png';
      case Service.dry_clean:
        return 'assets/images/dry.png';
    }
  }
}

// ignore: constant_identifier_names
enum Service { wash, iron, dry_clean, beddings }
