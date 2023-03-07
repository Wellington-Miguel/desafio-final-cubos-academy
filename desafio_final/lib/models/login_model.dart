class LoginModel {
  LoginModel({
    required this.message,
    required this.token,
    required this.type,
    required this.expiresIn,
  });
  late final String message;
  late final String token;
  late final String type;
  late final int expiresIn;
  
  LoginModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    token = json['token'];
    type = json['type'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['token'] = token;
    _data['type'] = type;
    _data['expiresIn'] = expiresIn;
    return _data;
  }
}