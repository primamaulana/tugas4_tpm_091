enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.link,
    required this.location,
    required this.year,
    required this.type,
    required this.deskripsi,

  });

  final String id;
  final String title;
  final String imageUrl;
  final String link;
  final String location;
  final String year;
  final String type;
  final List<String> deskripsi;
}
