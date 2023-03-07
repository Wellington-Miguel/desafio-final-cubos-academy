import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/user_data_model.dart';
import '../models/user_address_model.dart';
import '../models/user_contacts_model.dart';
import '../models/event_model.dart';
import '../resources/strings.dart';

class IncorrectPassword implements Exception {}
class UserNotFound implements Exception {}
class InternalServerError implements Exception {}
class Unauthorized implements Exception {}
class CPFAlreadyInUse implements Exception {}
class EmailAlreadyInUse implements Exception {}
class BadRequest implements Exception {}

const String _api = 'https://cubos-las-api.herokuapp.com';

class API {
  Future<LoginModel> login(String cpf, String password) async {
    final response = await http.post(
      Uri.parse('$_api/auth/login'),
      body: {'cpf': cpf, 'password': password},
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 201) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw IncorrectPassword();
    } else if (response.statusCode == 404) {
      throw UserNotFound();
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception(Strings.alertUnexpectedError);
    }
  }

  Future<UserDataModel> getUserData(String token) async {
    final response = await http.get(Uri.parse('$_api/user'), headers: {
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw Unauthorized();
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception(Strings.alertUnexpectedError);
    }
  }

  Future<UserDataModel> updateUserData({
    required String token,
    required String fullName,
    required String id,
    required String cpf,
    required String profilePictureUrl,
    required String birthDate,
  }) async {
    final response = await http.patch(
      Uri.parse('$_api/user'),
      body: jsonEncode({
        'fullName': fullName,
        'rg': id,
        'cpf': cpf,
        'profilePictureUrl': profilePictureUrl,
        'birthDate': birthDate,
      }),
      headers: {
        'Accept': 'application/json',
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      throw BadRequest();
    } else if (response.statusCode == 401) {
      throw Unauthorized();
    } else if (response.statusCode == 409) {
      throw CPFAlreadyInUse();
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception(Strings.alertUnexpectedError);
    }
  }

  Future<UserAddressModel> updateUserAdress({
    required String token,
    required String zipCode,
    required String street,
    required String houseNumber,
    required String houseComplement,
    required String district,
    required String city,
    required String state,
  }) async {
    final response = await http.patch(
      Uri.parse('$_api/user/address'),
      body: jsonEncode({
        'cep': zipCode,
        'street': street,
        'number': houseNumber,
        'complement': houseComplement,
        'district': district,
        'city': city,
        'state': state,
      }),
      headers: {
        'Accept': 'application/json',
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserAddressModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      throw BadRequest();
    } else if (response.statusCode == 401) {
      throw Unauthorized();
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception(Strings.alertUnexpectedError);
    }
  }

  Future<UserContactsModel> updateUserContacts({
    required String token,
    required String email,
    required String phone,
    required String mobilePhone,
  }) async {
    final response = await http.patch(
      Uri.parse('$_api/user/contacts'),
      body: jsonEncode({
        'email': email,
        'phone': phone,
        'mobilePhone': mobilePhone,
      }),
      headers: {
        'Accept': 'application/json',
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserContactsModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      throw BadRequest();
    } else if (response.statusCode == 401) {
      throw Unauthorized();
    } else if (response.statusCode == 409) {
      throw EmailAlreadyInUse();
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception(Strings.alertUnexpectedError);
    }
  }

  Future<UserDataModel> register({
    required String fullName,
    required String cpf,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_api/user'),
      body: jsonEncode({
        'fullName': fullName,
        'cpf': cpf,
        'email': email,
        'password': password,
      }),
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      throw BadRequest();
    } else if (response.statusCode == 409) {
      throw CPFAlreadyInUse;
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception('Unexpected Error');
    }
  }

  Future<List<EventModel>> getEvent({required String token}) async {
    final response = await http.get(Uri.parse('$_api/events'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      List listEventes = json.decode(response.body);
      return listEventes.map((json) => EventModel.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      throw Unauthorized();
    } else if (response.statusCode == 500) {
      throw InternalServerError();
    } else {
      throw Exception(Strings.alertUnexpectedError);
    }
  }
}