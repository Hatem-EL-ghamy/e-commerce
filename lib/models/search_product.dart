class Searchproducts {
  bool? status;
  String? message;
  Data? data;

  Searchproducts({this.status, this.message, this.data});

  Searchproducts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Search>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Search>[];
      json['products'].forEach((v) {
        products!.add(new Search.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Search {
  int? id;
  String? name;
  double? price;
  double? oldPrice;
  String? image;
  double? discount;
  String? description;
  String? categoryName;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  bool? inFavorites;

  Search(
      {this.id,
        this.name,
        this.price,
        this.oldPrice,
        this.image,
        this.discount,
        this.description,
        this.categoryName,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.inFavorites});

  Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    discount = json['discount'];
    description = json['description'];
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inFavorites = json['in_favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['image'] = image;
    data['discount'] = discount;
    data['description'] = description;
    data['category_name'] = categoryName;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['in_favorites'] = inFavorites;
    return data;
  }
}