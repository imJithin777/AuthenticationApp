// ignore: camel_case_types
class Globals {
  static final Globals _instance = Globals.internal();

  factory Globals() => _instance;

  Globals.internal();

  static const USER_ID = 'USER_ID';
  static const EMAIL = "EMAIL";
  static const PASSWORD = "PASSWORD";
  static const IS_LOGIN = "IS_LOGIN";
  static const LANGUAGE = 'LANGUAGE';
  static const CUSTOMERDATAS = 'CUSTOMERDATAS';
  static const CURRENTCUSTOMERDATA = 'CURRENTCUSTOMERDATA';
}
