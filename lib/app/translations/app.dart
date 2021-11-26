
import 'package:authentication/app/translations/auth.dart';
import 'package:authentication/app/translations/home.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {


  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World %s',
          ...AuthTranslations.en,
          ...HomeTranslations.en

        },
      };
}
