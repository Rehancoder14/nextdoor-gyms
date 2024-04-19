import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class ApartmentSelectDropDown extends StatelessWidget {
  const ApartmentSelectDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textStyle: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.phone,
      autofocus: false,
      controller: context.read<SetupAccountProvider>().buildingController,
      hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      prefix: const Icon(Icons.phone),
    );
  }
}
