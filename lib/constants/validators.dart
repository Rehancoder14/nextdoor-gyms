import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: "Enter a valid email address"),
  ],
);

final mobileValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'Mobile is required'),
    MinLengthValidator(10, errorText: 'Mobile must be at least 10 digits long'),
    MaxLengthValidator(10, errorText: 'Mobile must be at least 10 digits long'),
  ],
);

final nameValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'Name is required'),
  ],
);
