import 'package:desafio_final/models/home_data_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../api/las_api.dart';
import '../widgets/alert_modal.dart';
import '../resources/strings.dart';
import '../models/full_data_model.dart';
import '../models/home_data_model.dart';
part 'controller_login.g.dart';

class ControllerLogin = _ControllerLoginBase with _$ControllerLogin;

abstract class _ControllerLoginBase with Store {
  @observable
  bool isButtonDisabled = false;

  @action
  void changeButtonState() => isButtonDisabled = !isButtonDisabled;

  @action
  Future login(
    API api,
    TextEditingController cpf,
    TextEditingController password,
    BuildContext context,
  ) async {
    final validCPF = cpf.text.replaceAll(RegExp(r'[.-]'), '');
    if (validCPF.length == 11) {
      changeButtonState();
      try {
        final result = await api.login(validCPF, password.text);
        final String token = '${result.type} ${result.token}';
        final userData = await api.getUserData(token);
        final eventsData = await api.getEvent(token: token);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
          arguments: HomeDataModel(
            fullData: FullDataModel(userData: userData, token: token),
            eventsData: eventsData,
          ),
        );
      } on IncorrectPassword {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) =>
              const AlertModal(title: Strings.alertIncorrectPassword),
        );
      } on UserNotFound {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const AlertModal(title: Strings.alertUserNotFound),
        );
      } on InternalServerError {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) =>
              const AlertModal(title: Strings.alertInternalServerError),
        );
      }
      changeButtonState();
    }
  }
}
