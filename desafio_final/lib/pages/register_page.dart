import 'package:desafio_final/mobx/controller_pages.dart';
import 'package:desafio_final/mobx/controller_register.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../controllers/text_controller.dart';
import '../widgets/secondary_screen.dart';
import '../widgets/logo.dart';
import '../widgets/button.dart';
import '../widgets/fieldtext.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    super.initState();
    TextControllers.instance.fullName = TextEditingController();
    TextControllers.instance.email = TextEditingController();
    TextControllers.instance.cpf = TextEditingController();
    TextControllers.instance.password = TextEditingController();
  }

  @override
  void dispose() {
    TextControllers.instance.fullName.dispose();
    TextControllers.instance.email.dispose();
    TextControllers.instance.cpf.dispose();
    TextControllers.instance.password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ControllerPage>(context).api;
    final controllerRegister = ControllerRegister();
    final width = MediaQuery.of(context).size.width * 0.875;
    final double textFieldWidth;

    final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        kIsWeb;

    if (isDesktop) {
      textFieldWidth = width > 480 ? 480 : width;
    } else {
      textFieldWidth = width;
    }

    return SecondaryScreen(
      isRegister: true,
      children: [
        const SizedBox(height: 30),
        const Logo(),
        const Text(
          Strings.registerTitle,
          style: TextStyle(
            color: Colours.black,
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          Strings.subtitleRegister,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colours.textColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: textFieldWidth,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                FieldText(
                  label: Strings.fullName,
                  focus: true,
                  textController: TextControllers.instance.fullName,
                ),
                FieldText(
                  label: Strings.email,
                  focus: false,
                  textController: TextControllers.instance.email,
                ),
                FieldText(
                  label: Strings.cpf,
                  focus: false,
                  textController: TextControllers.instance.cpf,
                ),
                FieldText(
                  label: Strings.password,
                  focus: false,
                  textController: TextControllers.instance.password,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Observer(
          builder: ((context) {
            return Button(
              isMenuButton: false,
              onPressed: controllerRegister.isButtonDisabled
                  ? null
                  : () => controllerRegister.register(
                      api,
                      TextControllers.instance.fullName,
                      TextControllers.instance.cpf,
                      TextControllers.instance.email,
                      TextControllers.instance.password,
                      context),
              child: const Text(
                Strings.registerButton,
                style: TextStyle(
                  color: Colours.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
