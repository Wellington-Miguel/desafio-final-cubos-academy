// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_field_text.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerFieldText on _ControllerFieldTextBase, Store {
  late final _$isPasswordVisibleAtom = Atom(
      name: '_ControllerFieldTextBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$_ControllerFieldTextBaseActionController =
      ActionController(name: '_ControllerFieldTextBase', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_ControllerFieldTextBaseActionController.startAction(
        name: '_ControllerFieldTextBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_ControllerFieldTextBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible}
    ''';
  }
}
