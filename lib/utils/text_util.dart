/*!
 * Utility for text
 */

final textUtils = TextUtils();

enum FormatHtmlKind {
  TITLE,
  SUB_HEADING,
  CONTENT,
}

class TextUtils {
  static final _onlyWordsEndsRe = RegExp(r"[^\s\w]+$");
  static final _longSpaceRe = RegExp(r"\s\s*");

  /// Truncate text string secara aman dengan cara
  /// men-strip terlebih dahulu unicode.
  static String truncate(String text, {int maxLength = 25}) {
    if (text.length > maxLength) {
      String newText = text.substring(0, maxLength);
      newText = newText.replaceAll(_onlyWordsEndsRe, "");
      newText = newText.replaceAll(_longSpaceRe, " ").trim();
      return newText + "...";
    } else {
      return text;
    }
  }

  bool validateName(String value) {
    RegExp regExp = RegExp(
        r"^([a-zA-Z0-9]+|[a-zA-Z0-9]+\s{1}[a-zA-Z0-9]{1,}|[a-zA-Z0-9]+\s{1}[a-zA-Z0-9]{3,}\s{1}[a-zA-Z0-9]{1,})$");
    //Iterable<Match> iterable = regExp.allMatches(value);
    return regExp.hasMatch(value);
  }

  bool validateUsername(String value) {
    RegExp regExp =
        RegExp(r"^(?=[a-zA-Z0-9._]{5,20}$)(?!.*[_.]{2})[^_.].*[^_.]$");
    //Iterable<Match> iterable = regExp.allMatches(value);
    return regExp.hasMatch(value);
  }

  bool validateEmail(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regExp.hasMatch(value);
  }

  bool validatePhone(String value) {
    RegExp telkomsel =
        RegExp(r"^(\+62|\+0|0|62)8(1[123]|52|53|21|22|23)[0-9]{5,9}$");
    RegExp simpati = RegExp(r"^(\+62|\+0|0|62)8(1[123]|2[12])[0-9]{5,9}$");
    RegExp kartuAs = RegExp(r"^(\+62|\+0|0|62)8(52|53|23)[0-9]{5,9}$");
    RegExp indosat = RegExp(
        r"^(\+62815|0815|62815|\+0815|\+62816|0816|62816|\+0816|\+62858|0858|62858|\+0814|\+62814|0814|62814|\+0814)[0-9]{5,9}$");
    RegExp m3 = RegExp(
        r"^(\+62855|0855|62855|\+0855|\+62856|0856|62856|\+0856|\+62857|0857|62857|\+0857)[0-9]{5,9}$");
    RegExp xl = RegExp(
        r"^(\+62817|0817|62817|\+0817|\+62818|0818|62818|\+0818|\+62819|0819|62819|\+0819|\+62859|0859|62859|\+0859|\+0878|\+62878|0878|62878|\+0877|\+62877|0877|62877)[0-9]{5,9}$");
    RegExp smartfren = RegExp(r"^(\+6288|088|6288|\+088)[0-9]{5,9}$");
    RegExp tri = RegExp(r"^(\+6289|089|6289|\+089)[0-9]{5,9}$");
    RegExp axis = RegExp(r"^(\+6283|083|6283|\+083)[0-9]{5,9}$");
    //Iterable<Match> iterable = regExp.allMatches(value);
    var check = telkomsel.hasMatch(value) ||
        simpati.hasMatch(value) ||
        kartuAs.hasMatch(value) ||
        indosat.hasMatch(value) ||
        m3.hasMatch(value) ||
        xl.hasMatch(value) ||
        smartfren.hasMatch(value) ||
        tri.hasMatch(value) ||
        axis.hasMatch(value);
    return check;
  }

  String toTitle(String value) {
    if (value.length < 80) return value;
    return '${value.substring(0, 80)}...';
  }

  String toPhoneNumber(String value) {
    var first2digit = value.substring(0, 2);
    if (first2digit == '08') {
      return value.replaceFirst('08', '+628');
    } else if (first2digit == '62') {
      return value.replaceFirst('62', '+62');
    }
    return value;
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
