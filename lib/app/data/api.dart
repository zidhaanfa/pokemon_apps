import '../config/config.dart';

String domain = ConfigEnvironments.getEnvironments()['url']!;

class Api {
  static var pokemon = "$domain/pokemon/";
}
