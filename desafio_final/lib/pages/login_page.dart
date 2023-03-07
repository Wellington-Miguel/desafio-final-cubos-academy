import 'package:desafio_final/mobx/controller_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../controllers/text_controller.dart';
import '../mobx/controller_login.dart';
import '../widgets/secondary_screen.dart';
import '../widgets/logo.dart';
import '../widgets/button.dart';
import '../widgets/fieldtext.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerLogin = ControllerLogin();

  @override
  void initState() {
    super.initState();
    TextControllers.instance.cpf = TextEditingController();
    TextControllers.instance.password = TextEditingController();
  }

  @override
  void dispose() {
    TextControllers.instance.cpf.dispose();
    TextControllers.instance.password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ControllerPage>(context).api;
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
      children: [
        const SizedBox(height: 30),
        const Logo(),
        const Text(
          Strings.loginTitle,
          style: TextStyle(
            color: Colours.black,
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          Strings.subtitleLogin,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colours.textColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 31),
        SizedBox(
          width: textFieldWidth,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                FieldText(
                  label: Strings.cpf,
                  focus: true,
                  textController: TextControllers.instance.cpf,
                ),
                const SizedBox(height: 10),
                FieldText(
                  label: Strings.password,
                  focus: false,
                  textController: TextControllers.instance.password,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Observer(builder: (context) {
          return Button(
            child: const Text(
              Strings.enterButton,
              style: TextStyle(
                color: Colours.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: controllerLogin.isButtonDisabled
                ? null
                : () => controllerLogin.login(api, TextControllers.instance.cpf,
                    TextControllers.instance.password, context),
          );
        }),
        const SizedBox(height: 20),
      ],
    );
  }
}