class UserAddressModel {
  UserAddressModel({
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
  late final String? number;
  late final String? complement;
  late final String? district;
  late final String? city;
  late final String? state;
  
  UserAddressModel.fromJson(Map<String, dynamic> json){
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