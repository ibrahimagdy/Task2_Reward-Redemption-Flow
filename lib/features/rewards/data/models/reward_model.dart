class RewardModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int pointsCost;
  final String category;
  final bool isAvailable;

  RewardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.pointsCost,
    required this.category,
    this.isAvailable = true,
  });
}
