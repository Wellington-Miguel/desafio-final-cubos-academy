class UserContactsModel {
  UserContactsModel({
    required this.email,
    this.phone,
    this.mobilePhone,
  });
  late final String email;
  late final String? phone;
  late final String? mobilePhone;
  
  UserContactsModel.fromJson(Map<String, dynamic> json){
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