import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int id;
  String name;
  int rating;
  bool isRecommended;
  String description;
  int price;
  String image;
  Category category;
  String createdAt;
  bool isDeleted;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.isRecommended,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.createdAt,
    required this.isDeleted,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        rating: json["rating"],
        isRecommended: json["isRecommended"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        category: Category.fromMap(json["category"]),
        createdAt: json["createdAt"],
        isDeleted: json["isDeleted"],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        rating,
        isRecommended,
        description,
        price,
        image,
        category,
        createdAt,
        isDeleted,
      ];
}

class Category extends Equatable {
  int id;
  String name;
  String image;
  String? createdAt;
  bool? isDeleted;

  Category({
    required this.id,
    required this.name,
    required this.image,
    this.createdAt,
    this.isDeleted,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["createdAt"],
        isDeleted: json["isDeleted"],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        createdAt,
        isDeleted,
      ];
}
