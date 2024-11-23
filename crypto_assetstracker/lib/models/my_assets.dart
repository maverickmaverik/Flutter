import 'category.dart';

class MyAsset {
  final String id;
  final String name;
  final double quantity;
  final double buyPrice;
  final Categories category;

  const MyAsset({
    required this.id,
    required this.name,
    required this.quantity,
    required this.buyPrice,
    required this.category,
  });
}
