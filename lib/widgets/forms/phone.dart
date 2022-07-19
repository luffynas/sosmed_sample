import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  static final RegExp telkomsel =
      RegExp(r"^(\+62|\+0|0|62)8(1[123]|52|53|21|22|23)[0-9]{5,10}$");
  static final RegExp simpati =
      RegExp(r"^(\+62|\+0|0|62)8(1[123]|2[12])[0-9]{5,10}$");
  static final RegExp kartuAs =
      RegExp(r"^(\+62|\+0|0|62)8(51|52|53|23)[0-9]{5,10}$");
  static final RegExp indosat = RegExp(
      r"^(\+62815|0815|62815|\+0815|\+62816|0816|62816|\+0816|\+62858|0858|62858|\+0814|\+62814|0814|62814|\+0814)[0-9]{5,10}$");
  static final RegExp m3 = RegExp(
      r"^(\+62855|0855|62855|\+0855|\+62856|0856|62856|\+0856|\+62857|0857|62857|\+0857)[0-9]{5,10}$");
  static final RegExp xl = RegExp(
      r"^(\+62817|0817|62817|\+0817|\+62818|0818|62818|\+0818|\+62819|0819|62819|\+0819|\+62859|0859|62859|\+0859|\+0878|\+62878|0878|62878|\+0877|\+62877|0877|62877)[0-9]{5,10}$");
  static final RegExp smartfren =
      RegExp(r"^(\+6288|088|6288|\+088)[0-9]{5,10}$");
  static final RegExp tri = RegExp(r"^(\+6289|089|6289|\+089)[0-9]{5,10}$");
  static final RegExp axis = RegExp(r"^(\+6283|083|6283|\+083)[0-9]{5,10}$");

  @override
  PhoneValidationError? validator(String value) {
    var check = telkomsel.hasMatch(value) ||
        simpati.hasMatch(value) ||
        kartuAs.hasMatch(value) ||
        indosat.hasMatch(value) ||
        m3.hasMatch(value) ||
        xl.hasMatch(value) ||
        smartfren.hasMatch(value) ||
        tri.hasMatch(value) ||
        axis.hasMatch(value);
    return check ? null : PhoneValidationError.invalid;
  }
}
