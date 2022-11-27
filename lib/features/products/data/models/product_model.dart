import 'package:equatable/equatable.dart';

import '../../../categories/data/models/category_model.dart';

class Product extends Equatable {
  int id;
  String name;
  int rating;
  bool isRecommended;
  String description;
  int price;
  String? image;
  Category? category;
  String? createdAt;
  bool? isDeleted;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.isRecommended,
    required this.description,
    required this.price,
    this.image,
    this.category,
    this.createdAt,
    this.isDeleted,
  });

  Product copyWith({
    int? id,
    String? name,
    int? rating,
    bool? isRecommended,
    String? description,
    int? price,
    String? image,
    Category? category,
    String? createdAt,
    bool? isDeleted,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        rating: rating ?? this.rating,
        isRecommended: isRecommended ?? this.isRecommended,
        description: description ?? this.description,
        price: price ?? this.price,
        image: image ?? this.image,
        category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );

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
