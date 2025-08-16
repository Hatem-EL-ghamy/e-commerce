class CartModel {
  bool? status;
  Data? data;

  CartModel({this.status, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class  Data{
  List<CartItems>? cartItems;
  double? subTotal;
  double? total;

  Data({this.cartItems, this.subTotal, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['sub_total'] = this.subTotal;
    data['total'] = this.total;
    return data;
  }
}

class CartItems {
  int? id;
  int? userId;
  int? productId;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  Product? product;

  CartItems(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  double? price;
  // ignore: prefer_typing_uninitialized_variables
  var oldPrice;
  String? image;
  int? proCount;
  // ignore: prefer_typing_uninitialized_variables
  var discount;
  String? description;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  bool? inFavorites;
  bool? inCart;

  Product(
      {this.id,
        this.name,
        this.price,
        this.oldPrice,
        this.image,
        this.proCount,
        this.discount,
        this.description,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.inFavorites,
        this.inCart});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    proCount = json['pro_count'];
    discount = json['discount'];
    description = json['description'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['image'] = this.image;
    data['pro_count'] = this.proCount;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
}