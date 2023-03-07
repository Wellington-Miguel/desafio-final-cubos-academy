import 'package:mobx/mobx.dart';
part 'controller_field_text.g.dart';

class ControllerFieldText = _ControllerFieldTextBase with _$ControllerFieldText;

abstract class _ControllerFieldTextBase with Store {
  @observable
  bool isPasswordVisible = true;

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;
}