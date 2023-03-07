// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_pages.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerPage on _ControllerPageBase, Store {
  late final _$acceptAtom =
      Atom(name: '_ControllerPageBase.accept', context: context);

  @override
  bool get accept {
    _$acceptAtom.reportRead();
    return super.accept;
  }

  @override
  set accept(bool value) {
    _$acceptAtom.reportWrite(value, super.accept, () {
      super.accept = value;
    });
  }

  late final _$_ControllerPageBaseActionController =
      ActionController(name: '_ControllerPageBase', context: context);

  @override
  void acceptTerms() {
    final _$actionInfo = _$_ControllerPageBaseActionController.startAction(
        name: '_ControllerPageBase.acceptTerms');
    try {
      return super.acceptTerms();
    } finally {
      _$_ControllerPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accept: ${accept}
    ''';
  }
}
