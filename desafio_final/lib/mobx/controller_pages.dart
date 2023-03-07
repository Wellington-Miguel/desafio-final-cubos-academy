import 'package:desafio_final/api/las_api.dart';
import 'package:desafio_final/mobx/controller_event_list.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'controller_pages.g.dart';

class ControllerPage = _ControllerPageBase with _$ControllerPage;

abstract class _ControllerPageBase with Store {
  final api = API();
  final listEventController = ListEventController();
  @observable
  bool accept = false;
  @action
  void acceptTerms() {
    accept = !accept;
  }

  //! Estou passando direto pela HomePage por enquanto já que estou passando o token por argumento
  // void pageRoutesMenu(int index, BuildContext context) {
  //   switch (index) {
  //     case 0:
  //       listEventController.eventList(api, context);
  //       break;
  //     case 1:
  //       Navigator.pushNamed(context, '/data');
  //       break;
  //     case 2:
  //       Navigator.pushNamed(context, '/history');
  //       break;
  //     case 3:
  //       break;
  //   }
  // }
}
