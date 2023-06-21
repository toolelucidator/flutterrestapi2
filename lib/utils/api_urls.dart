class ApiUrls {
  static final String baseUrl = 'http://restapi.adequateshop.com/api/';
  static _AuthUrls authEndpoints = _AuthUrls();
}

class _AuthUrls {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}
