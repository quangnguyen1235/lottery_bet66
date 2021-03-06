class AppEndpoint {
  AppEndpoint._();

  static const String BASE_URL = "https://xoso9988.com";

  static const int connectionTimeout = 1500;
  static const int receiveTimeout = 1500;
  static const String keyAuthorization = "Authorization";

  static const int SUCCESS = 1;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  static const String DRAW_RESULT = "/server/lottery/drawResult";
}
