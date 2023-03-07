class UserDataModel {
  UserDataModel({
    required this.id,
    required this.fullName,
    required this.cpf,
    required this.rg,
    required this.birthDate,
    required this.contacts,
    required this.address,
    required this.profilePictureUrl,
    required this.createdAt,
  });
  late final int id;
  late final String fullName;
  late final String cpf;
  late final String? rg;
  late final String? birthDate;
  late final Contacts contacts;
  late final Address address;
  late final String? profilePictureUrl;
  late final String createdAt;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    cpf = json['cpf'];
    rg = json['rg'];
    birthDate = json['birthDate'];
    contacts = Contacts.fromJson(json['contacts']);
    address = Address.fromJson(json['address']);
    profilePictureUrl = json['profilePictureUrl'];
    createdAt = json['createdAt'];
  }

  get token => null;

  get type => null;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullName'] = fullName;
    _data['rg'] = rg;
    _data['cpf'] = cpf;
    _data['profilePictureUrl'] = profilePictureUrl;
    _data['birthDate'] = birthDate;
    _data['createdAt'] = createdAt;
    _data['address'] = address.toJson();
    _data['contacts'] = contacts.toJson();
    return _data;
  }
}

class Contacts {
  Contacts({
    required this.email,
    this.phone,
    this.mobilePhone,
  });
  late final String email;
  late final String? phone;
  late final String? mobilePhone;

  Contacts.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    mobilePhone = json['mobilePhone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['phone'] = phone;
    _data['mobilePhone'] = mobilePhone;
    return _data;
  }
}

class Address {
  Address({
    this.cep,
    this.street,
    this.number,
    this.complement,
    this.district,
    this.city,
    this.state,
  });
  late final String? cep;
  late final String? street;
  late final int? number;
  late final String? complement;
  late final String? district;
  late final String? city;
  late final String? state;

  Address.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    street = json['street'];
    number = json['number'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cep'] = cep;
    _data['street'] = street;
    _data['number'] = number;
    _data['complement'] = complement;
    _data['district'] = district;
    _data['city'] = city;
    _data['state'] = state;
    return _data;
  }
}
