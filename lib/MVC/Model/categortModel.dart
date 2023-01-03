import 'dart:convert';

CategoryModel baseModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String baseModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.title,
    this.image,
  });

  String? title;
  String? image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": image,
      };
}
