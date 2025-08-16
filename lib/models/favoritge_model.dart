class FavoritesModel {
  bool? status;
  Data? data;

  FavoritesModel({this.status, this.data});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<FavoritesPorduct>? favoritesPorduct;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  void nextPageUrl;
  String? path;
  int? perPage;
  void prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.favoritesPorduct,
      this.currentPage,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['favorites_porduct'] != null) {
      favoritesPorduct = <FavoritesPorduct>[];
      json['favorites_porduct'].forEach((v) {
        favoritesPorduct!.add(FavoritesPorduct.fromJson(v));
      });
    }
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (favoritesPorduct != null) {
      data['favorites_porduct'] =
          favoritesPorduct!.map((v) => v.toJson()).toList();
    }
    data['current_page'] = currentPage;
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    // data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    // data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class FavoritesPorduct {
  int? idFav;
  Porduct? porduct;

  FavoritesPorduct({this.idFav, this.porduct});

  FavoritesPorduct.fromJson(Map<String, dynamic> json) {
    idFav = json['id_fav'];
    porduct =
        json['porduct'] != null ? Porduct.fromJson(json['porduct']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_fav'] = idFav;
    if (porduct != null) {
      data['porduct'] = porduct!.toJson();
    }
    return data;
  }
}

class Porduct {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;

  Porduct(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description});

  Porduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
