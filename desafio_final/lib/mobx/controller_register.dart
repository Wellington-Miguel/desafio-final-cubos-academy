import 'package:desafio_final/api/las_api.dart';
import 'package:desafio_final/resources/strings.dart';
import 'package:desafio_final/widgets/alert_modal.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'controller_register.g.dart';

class ControllerRegister = _ControllerRegisterBase with _$ControllerRegister;

abstract class _ControllerRegisterBase with Store {
  @observable
  bool isButtonDisabled = false;

  @action
  void changeButtonState() => isButtonDisabled = !isButtonDisabled;

  @action
  Future register(
    API api,
    TextEditingController fullName,
    TextEditingController cpf,
    TextEditingController email,
    TextEditingController password,
    BuildContext context,
  ) async {
    final validCPF = cpf.text.replaceAll(RegExp(r'[.-]'), '');
    if (validCPF.length == 11) {
      changeButtonState();
      try {
        await api.register(
            fullName: fullName.text,
            cpf: validCPF,
            email: email.text,
            password: password.text);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertModal(
            title: Strings.alertRegister,
            onPressed: () => Navigator.pushNamed(
              context,
              '/login',
            ),
          ),
        );
      } on CPFAlreadyInUse {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const AlertModal(title: Strings.alertCPF),
        );
      } on BadRequest {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const AlertModal(title: 'BAD REQUEST'),
        );
      } on InternalServerError {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) =>
              const AlertModal(title: Strings.alertInternalServerError),
        );
      } catch (e) {
        debugPrint('$e');
      }
      changeButtonState();
    }
  }
}
