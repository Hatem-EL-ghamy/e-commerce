class OrdersModel {
  bool? status;
  Data? data;

  OrdersModel({this.status, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
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
  List<Order>? order;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  void prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.order,
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
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(Order.fromJson(v));
      });
    }
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
    if (order != null) {
      data['order'] = order!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    // data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Order {
  int? id;
  String? orderCost;
  String? date;
  String? status;
  String? orderType;
  int? addressId;
  String? paymentMethod;
  String? costDelivery;
  String? total;

  Order(
      {this.id,
      this.orderCost,
      this.date,
      this.status,
      this.orderType,
      this.addressId,
      this.paymentMethod,
      this.costDelivery,
      this.total});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCost = json['order_cost'];
    date = json['date'];
    status = json['status'];
    orderType = json['order_type'];
    addressId = json['address_id'];
    paymentMethod = json['payment_method'];
    costDelivery = json['cost_delivery'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_cost'] = orderCost;
    data['date'] = date;
    data['status'] = status;
    data['order_type'] = orderType;
    data['address_id'] = addressId;
    data['payment_method'] = paymentMethod;
    data['cost_delivery'] = costDelivery;
    data['total'] = total;
    return data;
  }
}
