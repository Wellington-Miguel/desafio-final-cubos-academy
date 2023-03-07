import 'package:desafio_final/api/las_api.dart';
import 'package:desafio_final/resources/strings.dart';
import 'package:desafio_final/widgets/alert_modal.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../resources/strings.dart';
part 'controller_event_list.g.dart';

class ListEventController = _ListEventControllerBase with _$ListEventController;

abstract class _ListEventControllerBase with Store {
  @action
  Future eventList({
    required API api,
    required BuildContext context,
    required String token,
  }) async {
    try {
      final result = await api.getEvent(token: token);
      Navigator.pushNamed(
        context,
        Strings.routeEvents,
        arguments: result,
      );
    } on Unauthorized {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const AlertModal(title: Strings.alertUnauthorized),
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
  }
}
