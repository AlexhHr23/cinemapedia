
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {

  static String movieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
  static String baseUrl = dotenv.env['BASE_URL'] ?? 'No hay url base';

}