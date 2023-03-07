import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../widgets/alert_modal.dart';
import '../resources/strings.dart';
import '../api/las_api.dart';
import '../models/user_data_model.dart';
import '../models/full_data_model.dart';
part 'controller_data.g.dart';

class ControllerData = _ControllerDataBase with _$ControllerData;

abstract class _ControllerDataBase with Store {
  @observable
  bool isButtonDisabled = false;

  @action
  void changeButtonState() => isButtonDisabled = !isButtonDisabled;

  @action
  Future updateData({
    required String token,
    required BuildContext context,
    required API api,
    required String fullName,
    required String id,
    required String cpf,
    required String profilePictureUrl,
    required String birthDate,
    required String zipCode,
    required String street,
    required String houseNumber,
    required String houseComplement,
    required String district,
    required String city,
    required String state,
    required String email,
    required String phone,
    required String mobilePhone,
  }) async {
    final validCPF = cpf.replaceAll(RegExp(r'[.-]'), '');
    final bool invalidData = validCPF.length != 11 ||
        fullName == '' ||
        id == '' ||
        birthDate == '' ||
        zipCode == '' ||
        street == '' ||
        houseNumber == '' ||
        houseComplement == '' ||
        district == '' ||
        city == '' ||
        state == '' ||
        email == '' ||
        phone == '' ||
        mobilePhone == '';
    if (invalidData) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const AlertModal(title: Strings.alertRequiredField),
      );
    } else {
      changeButtonState();
      try {
        final data = await api.updateUserData(
          token: token,
          fullName: fullName,
          id: id,
          cpf: validCPF,
          profilePictureUrl: profilePictureUrl,
          birthDate: birthDate.replaceAll(RegExp(r'[/]'), '').replaceAllMapped(
              RegExp(r'(\d{2})(\d{2})(\d{4})'),
              (match) => '${match[3]}-${match[2]}-${match[1]}'),
        );
        final contacts = await api.updateUserContacts(
          token: token,
          email: email,
          phone: phone.replaceAll(RegExp(r'[-]'), ''),
          mobilePhone: mobilePhone.replaceAll(RegExp(r'[-() +]'), ''),
        );
        final address = await api.updateUserAdress(
          token: token,
          zipCode: zipCode.replaceAll(RegExp(r'[-]'), ''),
          street: street,
          houseNumber: houseNumber,
          houseComplement: houseComplement,
          district: district,
          city: city,
          state: state,
        );
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertModal(
            title: Strings.alertChangedData,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
              arguments: FullDataModel(
                userData: UserDataModel(
                  id: data.id,
                  fullName: data.fullName,
                  cpf: data.cpf,
                  rg: data.rg,
                  birthDate: birthDate,
                  contacts: Contacts(
                    email: contacts.email,
                    mobilePhone: contacts.mobilePhone,
                    phone: contacts.phone,
                  ),
                  address: Address(
                    cep: address.cep,
                    city: address.city,
                    complement: address.complement,
                    district: address.district,
                    number: int.parse(address.number!),
                    state: address.state,
                    street: address.street,
                  ),
                  profilePictureUrl: data.profilePictureUrl,
                  createdAt: data.createdAt,
                ),
                token: token,
              ),
            ),
          ),
        );
      } on BadRequest {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const AlertModal(title: 'BAD REQUEST'),
        );
      } on CPFAlreadyInUse {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const AlertModal(title: Strings.alertCPF),
        );
      } on EmailAlreadyInUse {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const AlertModal(title: Strings.alertEmail),
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
