import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/strings.dart';
import '../mobx/controller_field_text.dart';

class FieldText extends StatelessWidget {
  final String label;
  final bool focus;
  final TextEditingController textController;

  const FieldText({
    Key? key,
    required this.label,
    required this.focus,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldTextController = ControllerFieldText();

    final bool isPassword = label == Strings.password;

    final Icon icon;
    if (isPassword) {
      icon = Icon(fieldTextController.isPasswordVisible
          ? Icons.visibility
          : Icons.visibility_off);
    } else {
      icon = const Icon(Icons.event);
    }

    final bool hasSufixIcon;
    if (isPassword || label == Strings.birthDate) {
      hasSufixIcon = true;
    } else {
      hasSufixIcon = false;
    }

    final TextInputType? textInput;
    final List<TextInputFormatter>? inputFormatter;
    String? hintText;
    switch (label) {
      case Strings.fullName:
        textInput = TextInputType.name;
        inputFormatter = null;
        break;
      case Strings.birthDate:
        textInput = TextInputType.number;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '##/##/####',
            filter: {'#': RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintBirthDate;
        break;
      case Strings.id:
        textInput = TextInputType.text;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '##.###.###-## +++ ++',
            filter: {
              '#': RegExp(r'[0-9]'),
              '+': RegExp(r'[A-Z]', caseSensitive: false),
            },
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintId;
        break;
      case Strings.cpf:
        textInput = TextInputType.number;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '###.###.###-##',
            filter: {'#': RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintCPF;
        break;
      case Strings.telephone:
        textInput = TextInputType.number;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '####-####',
            filter: {'#': RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintPhone;
        break;
      case Strings.cellphone:
        textInput = TextInputType.number;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '(##) #####-####',
            filter: {'#': RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintMobilePhone;
        break;
      case Strings.email:
        textInput = TextInputType.emailAddress;
        inputFormatter = null;
        hintText = Strings.hintEmail;
        break;
      case Strings.zipcode:
        textInput = TextInputType.number;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '#####-###',
            filter: {'#': RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintZipcode;
        break;
      case Strings.address:
        textInput = TextInputType.text;
        inputFormatter = null;
        hintText = Strings.hintStreet;
        break;
      case Strings.houseNumber:
        textInput = TextInputType.number;
        inputFormatter = [FilteringTextInputFormatter.digitsOnly];
        hintText = Strings.hintHouseNumber;
        break;
      case Strings.district:
        textInput = TextInputType.text;
        inputFormatter = null;
        hintText = Strings.hintDistrict;
        break;
      case Strings.houseComplement:
        textInput = TextInputType.text;
        inputFormatter = null;
        hintText = Strings.hintHouseComplement;
        break;
      case Strings.city:
        textInput = TextInputType.name;
        inputFormatter = null;
        hintText = Strings.hintCity;
        break;
      case Strings.state:
        textInput = TextInputType.text;
        inputFormatter = [
          MaskTextInputFormatter(
            mask: '##',
            filter: {'#': RegExp(r'[A-Z]', caseSensitive: false)},
            type: MaskAutoCompletionType.lazy,
          )
        ];
        hintText = Strings.hintState;
        break;
      case Strings.password:
        textInput = TextInputType.text;
        inputFormatter = null;
        break;
      default:
        textInput = TextInputType.text;
        inputFormatter = null;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 58,
        child: Observer(
          builder: (context) {
            return TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  labelText: label,
                  hintText: hintText,
                  helperText: '',
                  helperStyle: const TextStyle(height: 0.5),
                  errorStyle: const TextStyle(height: 0.5),
                  suffixIcon: hasSufixIcon
                      ? IconButton(
                          icon: icon,
                          onPressed:
                              fieldTextController.togglePasswordVisibility,
                          splashRadius: 15,
                        )
                      : null,
                ),
                textInputAction: TextInputAction.next,
                autofocus: focus,
                obscureText:
                    isPassword ? fieldTextController.isPasswordVisible : false,
                keyboardType: textInput,
                inputFormatters: inputFormatter,
                validator: (value) {
                  if (label == Strings.cpf) {
                    if (value == null || value.isEmpty) {
                      return Strings.formsRequiredField;
                    } else if (value.length != 14) {
                      return Strings.formInvalidCPF;
                    }
                  }
                  if (label == Strings.email) {
                    if (value == null || value.isEmpty) {
                      return Strings.formsRequiredField;
                    } else if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                        .hasMatch(value)) {
                      return Strings.formsInvalidEmail;
                    }
                  }
                  if (value == null || value.isEmpty) {
                    return Strings.formsRequiredField;
                  }
                  return null;
                });
          },
        ),
      ),
    );
  }
}
