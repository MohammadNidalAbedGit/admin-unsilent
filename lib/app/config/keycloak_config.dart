class Keycloak {
  static const String clientId = "admin-panel-flutter";
  static const String clientSecret = "lbrkJB9vFrY1FQ7BMQ8n6GS10c5JWL9F";
  static const String realm = "unsilent";
  static const String authServerUrl = "http://localhost:8082/";
  static Map<dynamic, dynamic> getConfiguration(){
   return {
      'resource': clientId,
      'realm': realm,
      'credentials': {
        "secret": clientSecret
      },
      'auth-server-url': authServerUrl
    };
  }

}
