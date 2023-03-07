// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerLogin on _ControllerLoginBase, Store {
  late final _$isButtonDisabledAtom =
      Atom(name: '_ControllerLoginBase.isButtonDisabled', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('_ControllerLoginBase.login', context: context);

  @override
  Future<dynamic> login(API api, TextEditingController cpf,
      TextEditingController password, BuildContext context) {
    return _$loginAsyncAction
        .run(() => super.login(api, cpf, password, context));
  }

  late final _$_ControllerLoginBaseActionController =
      ActionController(name: '_ControllerLoginBase', context: context);

  @override
  void changeButtonState() {
    final _$actionInfo = _$_ControllerLoginBaseActionController.startAction(
        name: '_ControllerLoginBase.changeButtonState');
    try {
      return super.changeButtonState();
    } finally {
      _$_ControllerLoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonDisabled: ${isButtonDisabled}
    ''';
  }
}
