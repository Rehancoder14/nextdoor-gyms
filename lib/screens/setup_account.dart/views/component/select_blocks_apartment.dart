import 'package:flutter/material.dart';
import 'package:nextdoorgym/constants/constant_methods.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/screens/setup_account.dart/model/apartment_model.dart';
import 'package:nextdoorgym/theme/theme_helper.dart';
import 'package:nextdoorgym/utils/size.dart';
import 'package:provider/provider.dart';

class BlockSelectDropDown extends StatelessWidget {
  const BlockSelectDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Consumer<SetupAccountProvider>(
        builder: (context, provider, child) {
          return DropdownButtonFormField<ApartmentBlock>(
            dropdownColor: Colors.grey.shade300,
            value: provider.apartmentBlock,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: appTheme.indigo150,
            ),
            elevation: 16,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16,
            ),
            validator: (value) {
              if (value == null) {
                return 'Please select your block';
              }
              return null;
            },
            onChanged: (ApartmentBlock? newValue) {
              provider.selectBlock(newValue!);
            },
            decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                hintText: 'Select block',
                hintStyle: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.h),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.h),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.h),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
            borderRadius: BorderRadius.circular(15),
            items: provider.apartmentBlockList
                .map<DropdownMenuItem<ApartmentBlock>>(
              (ApartmentBlock value) {
                return DropdownMenuItem<ApartmentBlock>(
                  value: value,
                  child: Text(
                    capitalizeFirstLetter(
                      value.blockName!,
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
