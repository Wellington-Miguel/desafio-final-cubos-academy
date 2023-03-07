import 'package:desafio_final/mobx/controller_pages.dart';
import 'package:desafio_final/widgets/alert_modal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../widgets/primary_screen.dart';
import '../widgets/button.dart';
import '../resources/strings.dart';
import '../resources/colours.dart';

class CredentialPage extends StatelessWidget {
  const CredentialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScreen(
      title: Strings.credentialTitle,
      subtitle: 'Carnaval 2021',
      onPressed: () {
        Navigator.pop(context);
      },
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.8),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 125,
                    width: 238,
                    decoration: BoxDecoration(
                      color: Colours.white,
                      border: Border.all(color: Colours.termsBorder),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              SizedBox(width: 16),
                              Icon(
                                Icons.insert_drive_file,
                                color: Colours.textColor,
                                size: 48,
                              ),
                              SizedBox(width: 10),
                              Text(
                                Strings.acceptanceTerm,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colours.textColor),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                            color: Colours.termsBorder,
                            height: 1,
                            thickness: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: RichText(
                            text: TextSpan(
                              text: Strings.viewFile,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: Colours.linkText,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 104,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(
                              builder: (BuildContext context) {
                                return Checkbox(
                                    value: Provider.of<ControllerPage>(context)
                                        .accept,
                                    onChanged: (_) {
                                      Provider.of<ControllerPage>(context,
                                              listen: false)
                                          .acceptTerms();
                                    });
                              },
                            ),
                            const Text(
                              Strings.acceptTerms,
                              style: TextStyle(color: Colours.textColor),
                            ),
                          ],
                        ),
                        Observer(
                          builder: (BuildContext context) {
                            return Button(
                              onPressed: Provider.of<ControllerPage>(context)
                                      .accept
                                  ? () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => const AlertModal(
                                              title:
                                                  Strings.sucessRegistration));
                                    }
                                  : null,
                              child: const Text(
                                Strings.credentialButton,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              disabledText: const Text(
                                Strings.credentialButton,
                                style: TextStyle(
                                    color: Colours.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
