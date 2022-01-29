class Serverconfig {
  static const domaiNameServer = 'http://192.168.1.104:8000';

  static const INVALID_RESPONSE = 100;
  static const No_INTERNET = 101;
  static const INVALID_FORMAT = 102;
  static const UNKNOWN_ERROR = 103;
  static const SUCCESS = 200;

  static const regester = '/api/createAccount';
  static const login = '/api/login';
  static const get_category = '/api/categories/';
  static const get_categorys = '/api/categories';
  static const get_productById = '/api/products/';
  static const get_User = '/api/user';

  static const check_valid = '/api/auth/check_validity';
  static const get_prodact = '/api/products';
  static const add_prodact = '/api/products';
}
