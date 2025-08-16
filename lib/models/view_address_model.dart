class ViewAddressModel {
  bool? status;
  Data? data;

  ViewAddressModel({this.status, this.data});

  ViewAddressModel.fromJson(Map<String, dynamic> json) {
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

class Data {
  List<Address>? address;

  Data({this.address});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? latitude;
  String? longitude;
  String? notes;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
        this.name,
        this.city,
        this.region,
        this.details,
        this.latitude,
        this.longitude,
        this.notes,
        this.createdAt,
        this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['region'] = this.region;
    data['details'] = this.details;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}