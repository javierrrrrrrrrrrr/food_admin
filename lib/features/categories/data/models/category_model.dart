import 'package:equatable/equatable.dart';

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
        image: json["image"] ?? "",
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
