class ApiEndPoints {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";
  static const citiesUrl = _apiUrl + "cities";
  static const categoriesUrl = _apiUrl + "categories";

  static const subCategoriesUrl = _apiUrl + "sub-categories";
  static const productUrl = _apiUrl + "products";

  static const homeUrl = _apiUrl + "home";
  static const _authUrl = _apiUrl + "auth/";
  static const loginUrl = _authUrl + "login";
  static const registerUrl = _authUrl + "register";
  static const activateUrl = _authUrl + "activate";
  static const logoutUrl = _authUrl + "logout";
  static const forgotPasswordUrl = _authUrl + "forget-password";
  static const resetPasswordUrl = _authUrl + "reset-password";
}
