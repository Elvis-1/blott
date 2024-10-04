import '../service_locators.dart' as service_locator;

//import 'package:get_it/get_it.dart' as service_locator;
enum Environment { dev, prod, mock }

class AppConfig {
  AppConfig._();
  static const baseUrl = 'https://finnhub.io/api/v1';
}
