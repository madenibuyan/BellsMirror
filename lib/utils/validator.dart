class Validators {
  final phoneNumberRegExp = RegExp(
      r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');
 static var  _emailRegExp = RegExp(
     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
 static bool validateEmail(String value) {
    if (!_emailRegExp.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }

  String validatePhoneNumber(String value) {


    if (!phoneNumberRegExp.hasMatch(value.trim())) {
      return 'invalid phonenumber';
    }
    return null;
  }



}
