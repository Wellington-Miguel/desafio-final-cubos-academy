// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_register.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerRegister on _ControllerRegisterBase, Store {
  late final _$isButtonDisabledAtom =
      Atom(name: '_ControllerRegisterBase.isButtonDisabled', context: context);

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

  late final _$registerAsyncAction =
      AsyncAction('_ControllerRegisterBase.register', context: context);

  @override
  Future<dynamic> register(
      API api,
      TextEditingController fullName,
      TextEditingController cpf,
      TextEditingController email,
      TextEditingController password,
      BuildContext context) {
    return _$registerAsyncAction.run(
        () => super.register(api, fullName, cpf, email, password, context));
  }

  late final _$_ControllerRegisterBaseActionController =
      ActionController(name: '_ControllerRegisterBase', context: context);

  @override
  void changeButtonState() {
    final _$actionInfo = _$_ControllerRegisterBaseActionController.startAction(
        name: '_ControllerRegisterBase.changeButtonState');
    try {
      return super.changeButtonState();
    } finally {
      _$_ControllerRegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonDisabled: ${isButtonDisabled}
    ''';
  }
}
