import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../controllers/text_controller.dart';
import '../mobx/controller_data.dart';
import '../models/full_data_model.dart';
import '../widgets/button.dart';
import '../widgets/primary_screen.dart';
import '../widgets/fieldtext.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';
import '../api/las_api.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key, required this.data}) : super(key: key);
  final FullDataModel data;

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    super.initState();
    TextControllers.instance.fullName = TextEditingController(
      text: widget.data.userData.fullName,
    );
    TextControllers.instance.email = TextEditingController(
      text: widget.data.userData.contacts.email,
    );
    TextControllers.instance.cpf = TextEditingController(
      text: widget.data.userData.cpf.replaceAllMapped(
          RegExp(r'(\d{3})(\d{3})(\d{3})'),
          (match) => "${match[1]}.${match[2]}.${match[3]}-"),
    );
    TextControllers.instance.password = TextEditingController();
    TextControllers.instance.zip = TextEditingController(
      text: widget.data.userData.address.cep != null ? widget.data.userData.address.cep!.replaceAllMapped(RegExp(r'(\d{5})(\d{3})'), (match) => '${match[1]}-${match[2]}') : '',
    );
    TextControllers.instance.birthDate = TextEditingController(
      text: widget.data.userData.birthDate != null ? widget.data.userData.birthDate!.replaceAll(RegExp(r'[-]'), '').split('T').first.replaceAllMapped(RegExp(r'(\d{4})(\d{2})(\d{2})'),
        (match) => '${match[3]}/${match[2]}/${match[1]}') : '',
    );
    TextControllers.instance.id = TextEditingController(
      text: widget.data.userData.rg,
    );
    TextControllers.instance.telephone = TextEditingController(
      text: widget.data.userData.contacts.phone != null ? widget.data.userData.contacts.phone!.replaceAllMapped(RegExp(r'(\d{4})(\d{4})'), (match) => '${match[1]}-${match[2]}') : '',
    );
    TextControllers.instance.cellphone = TextEditingController(
      text: widget.data.userData.contacts.mobilePhone != null ? widget.data.userData.contacts.mobilePhone!.replaceAllMapped(RegExp(r'(\d{2})(\d{5})'), (match) => '(${match[1]}) ${match[2]}-') : '',
    );
    TextControllers.instance.address = TextEditingController(
      text: widget.data.userData.address.street ?? '',
    );
    TextControllers.instance.houseNumber = TextEditingController(
      text: widget.data.userData.address.number != null
          ? '${widget.data.userData.address.number}'
          : '',
    );
    TextControllers.instance.district = TextEditingController(
      text: widget.data.userData.address.district ?? '',
    );
    TextControllers.instance.houseComplement = TextEditingController(
      text: widget.data.userData.address.complement ?? '',
    );
    TextControllers.instance.city = TextEditingController(
      text: widget.data.userData.address.city ?? '',
    );
    TextControllers.instance.state = TextEditingController(
      text: widget.data.userData.address.state ?? '',
    );
  }

  @override
  void dispose() {
    TextControllers.instance.fullName.dispose();
    TextControllers.instance.email.dispose();
    TextControllers.instance.cpf.dispose();
    TextControllers.instance.password.dispose();
    TextControllers.instance.zip.dispose();
    TextControllers.instance.birthDate.dispose();
    TextControllers.instance.id.dispose();
    TextControllers.instance.telephone.dispose();
    TextControllers.instance.cellphone.dispose();
    TextControllers.instance.address.dispose();
    TextControllers.instance.houseNumber.dispose();
    TextControllers.instance.district.dispose();
    TextControllers.instance.houseComplement.dispose();
    TextControllers.instance.city.dispose();
    TextControllers.instance.state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerData = ControllerData();
    final api = API();

    final width = MediaQuery.of(context).size.width * 0.9;
    final double contentWidth;

    final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        kIsWeb;

    if (isDesktop) {
      contentWidth = width > 800 ? 800 : width;
    } else {
      contentWidth = width;
    }

    const double spacer = 8;

    return PrimaryScreen(
      title: Strings.myData,
      avatar: widget.data.userData.profilePictureUrl ?? Strings.alternativeImage,
      onPressed: () {
        Navigator.pop(context);
      },
      children: [
        Text(
          widget.data.userData.fullName.split(' ').first,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colours.textColor,
          ),
        ),
        const Text(
          Strings.changePhoto,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colours.blue,
          ),
        ),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: spacer),
                child: Text(
                  Strings.myPersonalData,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colours.textColor,
                  ),
                ),
              ),
              FieldText(
                label: Strings.fullName,
                focus: false,
                textController: TextControllers.instance.fullName,
              ),
              FieldText(
                label: Strings.birthDate,
                focus: false,
                textController: TextControllers.instance.birthDate,
              ),
              FieldText(
                label: Strings.id,
                focus: false,
                textController: TextControllers.instance.id,
              ),
              FieldText(
                label: Strings.cpf,
                focus: false,
                textController: TextControllers.instance.cpf,
              ),
              const SizedBox(height: spacer),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: spacer),
                child: Text(
                  Strings.myContacts,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colours.textColor,
                  ),
                ),
              ),
              FieldText(
                label: Strings.telephone,
                focus: false,
                textController: TextControllers.instance.telephone,
              ),
              FieldText(
                label: Strings.cellphone,
                focus: false,
                textController: TextControllers.instance.cellphone,
              ),
              FieldText(
                label: Strings.email,
                focus: false,
                textController: TextControllers.instance.email,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: spacer),
                child: Text(
                  Strings.myAdress,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colours.textColor,
                  ),
                ),
              ),
              FieldText(
                label: Strings.zipcode,
                focus: false,
                textController: TextControllers.instance.zip,
              ),
              FieldText(
                label: Strings.address,
                focus: false,
                textController: TextControllers.instance.address,
              ),
              Row(
                children: [
                  SizedBox(
                    width: contentWidth * 0.227,
                    child: FieldText(
                      label: Strings.houseNumber,
                      focus: false,
                      textController: TextControllers.instance.houseNumber,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                      child: FieldText(
                    label: Strings.district,
                    focus: false,
                    textController: TextControllers.instance.district,
                  )),
                ],
              ),
              FieldText(
                label: Strings.houseComplement,
                focus: false,
                textController: TextControllers.instance.houseComplement,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: FieldText(
                    label: Strings.city,
                    focus: false,
                    textController: TextControllers.instance.city,
                  )),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: contentWidth * 0.227,
                    child: FieldText(
                      label: Strings.state,
                      focus: false,
                      textController: TextControllers.instance.state,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 62),
              Center(
                child: Button(
                  isMenuButton: false,
                  onPressed: controllerData.isButtonDisabled
                      ? null
                      : () => controllerData.updateData(
                            token: widget.data.token,
                            context: context,
                            api: api,
                            fullName: TextControllers.instance.fullName.text,
                            id: TextControllers.instance.id.text.toUpperCase(),
                            cpf: TextControllers.instance.cpf.text,
                            birthDate: TextControllers.instance.birthDate.text,
                            email: TextControllers.instance.email.text,
                            zipCode: TextControllers.instance.zip.text,
                            street: TextControllers.instance.address.text,
                            houseNumber:
                                TextControllers.instance.houseNumber.text,
                            houseComplement:
                                TextControllers.instance.houseComplement.text,
                            district: TextControllers.instance.district.text,
                            city: TextControllers.instance.city.text,
                            state: TextControllers.instance.state.text.toUpperCase(),
                            phone: TextControllers.instance.telephone.text,
                            mobilePhone: TextControllers.instance.cellphone.text,
                            //TODO
                            profilePictureUrl: widget.data.userData.profilePictureUrl != null ? widget.data.userData.profilePictureUrl! : Strings.alternativeImage,
                          ),
                  child: const Text(Strings.saveButton),
                ),
              ),
              const SizedBox(height: 44),
            ],
          ),
        ),
      ],
    );
  }
}