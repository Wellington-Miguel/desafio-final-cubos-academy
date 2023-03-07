// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerData on _ControllerDataBase, Store {
  late final _$isButtonDisabledAtom =
      Atom(name: '_ControllerDataBase.isButtonDisabled', context: context);

  @override
  bool get isButtonDisabled {
    _$isButtonDisabledAtom.reportRead();
    return super.isButtonDisabled;
  }

  @override
  set isButtonDisabled(bool value) {
    _$isButtonDisabledAtom.reportWrite(value, super.isButtonDisabled, () {
      super.isButtonDisabled = value;
    });
  }

  late final _$updateDataAsyncAction =
      AsyncAction('_ControllerDataBase.updateData', context: context);

  @override
  Future<dynamic> updateData(
      {required String token,
      required BuildContext context,
      required API api,
      required String fullName,
      required String id,
      required String cpf,
      required String profilePictureUrl,
      required String birthDate,
      required String zipCode,
      required String street,
      required String houseNumber,
      required String houseComplement,
      required String district,
      required String city,
      required String state,
      required String email,
      required String phone,
      required String mobilePhone}) {
    return _$updateDataAsyncAction.run(() => super.updateData(
        token: token,
        context: context,
        api: api,
        fullName: fullName,
        id: id,
        cpf: cpf,
        profilePictureUrl: profilePictureUrl,
        birthDate: birthDate,
        zipCode: zipCode,
        street: street,
        houseNumber: houseNumber,
        houseComplement: houseComplement,
        district: district,
        city: city,
        state: state,
        email: email,
        phone: phone,
        mobilePhone: mobilePhone));
  }

  late final _$_ControllerDataBaseActionController =
      ActionController(name: '_ControllerDataBase', context: context);

  @override
  void changeButtonState() {
    final _$actionInfo = _$_ControllerDataBaseActionController.startAction(
        name: '_ControllerDataBase.changeButtonState');
    try {
      return super.changeButtonState();
    } finally {
      _$_ControllerDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonDisabled: ${isButtonDisabled}
    ''';
  }
}
