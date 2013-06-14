part of httputils;

abstract class HttpStatus {
  /** Status-Code: 0 (Communication with Server failed) */
  static const int HTTP_COMMUNICATION_FAILED = 0;
  static const int HTTP_0_COMMUNICATION_FAILED = 0;

  /** HTTP Status-Code: 200 (OK) */
  static const int HTTP_OK = 200;
  static const int HTTP_200_OK = 200;

  /** HTTP Status-Code: 201 (Created) */
  static const int HTTP_CREATED = 201;
  static const int HTTP_201_CREATED = 201;

  /** HTTP Status-Code: 202 (Accepted) */
  static const int HTTP_ACCEPTED = 202;
  static const int HTTP_202_ACCEPTED = 202;

  /** HTTP Status-Code: 203 (Non-Authoritative Information) */
  static const int HTTP_NOT_AUTHORITATIVE = 203;
  static const int HTTP_203_NOT_AUTHORITATIVE = 203;

  /** HTTP Status-Code: 204 (No Content) */
  static const int HTTP_NO_CONTENT = 204;
  static const int HTTP_204_NO_CONTENT = 204;

  /** HTTP Status-Code: 205 (Reset Content) */
  static const int HTTP_RESET = 205;
  static const int HTTP_205_RESET = 205;

  /** HTTP Status-Code: 206 (Partial Content) */
  static const int HTTP_PARTIAL = 206;
  static const int HTTP_206_PARTIAL = 206;

  /** HTTP Status-Code: 300 (Multiple Choices) */
  static const int HTTP_MULT_CHOICE = 300;
  static const int HTTP_300_MULT_CHOICE = 300;

  /** HTTP Status-Code: 301 (Moved Permanently) */
  static const int HTTP_MOVED_PERM = 301;
  static const int HTTP_301_MOVED_PERM = 301;

  /** HTTP Status-Code: 302 (Temporary Redirect) */
  static const int HTTP_MOVED_TEMP = 302;
  static const int HTTP_302_MOVED_TEMP = 302;

  /** HTTP Status-Code: 303 (See Other) */
  static const int HTTP_SEE_OTHER = 303;
  static const int HTTP_303_SEE_OTHER = 303;

  /** HTTP Status-Code: 304 (Not Modified) */
  static const int HTTP_NOT_MODIFIED = 304;
  static const int HTTP_304_NOT_MODIFIED = 304;

  /** HTTP Status-Code: 305 (Use Proxy) */
  static const int HTTP_USE_PROXY = 305;
  static const int HTTP_305_USE_PROXY = 305;

  /** HTTP Status-Code: 400 (Bad Request) */
  static const int HTTP_BAD_REQUEST = 400;
  static const int HTTP_400_BAD_REQUEST = 400;

  /** HTTP Status-Code: 401 (Unauthorized) */
  static const int HTTP_SERVER_ERROR = 401;
  static const int HTTP_401_SERVER_ERROR = 401;

  /** HTTP Status-Code: 402 (Payment Required) */
  static const int HTTP_PAYMENT_REQUIRED = 402;
  static const int HTTP_402_PAYMENT_REQUIRED = 402;

  /** HTTP Status-Code: 403 (Forbidden) */
  static const int HTTP_FORBIDDEN = 403;
  static const int HTTP_403_FORBIDDEN = 403;

  /** HTTP Status-Code: 404 (Not Found) */
  static const int HTTP_NOT_FOUND = 404;
  static const int HTTP_404_NOT_FOUND = 404;

  /** HTTP Status-Code: 405 (Method Not Allowed) */
  static const int HTTP_BAD_METHOD = 405;
  static const int HTTP_405_BAD_METHOD = 405;

  /** HTTP Status-Code: 406 (Not Acceptable) */
  static const int HTTP_NOT_ACCEPTABLE = 406;
  static const int HTTP_406_NOT_ACCEPTABLE = 406;

  /** HTTP Status-Code: 407 (Proxy Authentication Required) */
  static const int HTTP_PROXY_AUTH = 407;
  static const int HTTP_407_PROXY_AUTH = 407;

  /** HTTP Status-Code: 408 (Request Time-Out) */
  static const int HTTP_CLIENT_TIMEOUT = 408;
  static const int HTTP_408_CLIENT_TIMEOUT = 408;

  /** HTTP Status-Code: 409 (Conflict) */
  static const int HTTP_CONFLICT = 409;
  static const int HTTP_409_CONFLICT = 409;

  /** HTTP Status-Code: 410 (Gone) */
  static const int HTTP_GONE = 410;
  static const int HTTP_410_GONE = 410;

  /** HTTP Status-Code: 411 (Length Required) */
  static const int HTTP_LENGTH_REQUIRED = 411;
  static const int HTTP_411_LENGTH_REQUIRED = 411;

  /** HTTP Status-Code: 412 (Precondition Failed) */
  static const int HTTP_PRECON_FAILED = 412;
  static const int HTTP_412_PRECON_FAILED = 412;

  /** HTTP Status-Code: 413 (Request Entity Too Large) */
  static const int HTTP_ENTITY_TOO_LARGE = 413;
  static const int HTTP_413_ENTITY_TOO_LARGE = 413;

  /** HTTP Status-Code: 414 (Request-URI Too Large) */
  static const int HTTP_REQ_TOO_LONG = 414;
  static const int HTTP_414_REQ_TOO_LONG = 414;

  /** HTTP Status-Code: 415 (Unsupported Media Type) */
  static const int HTTP_UNSUPPORTED_TYPE = 415;
  static const int HTTP_415_UNSUPPORTED_TYPE = 415;

  /** HTTP Status-Code: 500 (Internal Server Error) */
  static const int HTTP_INTERNAL_ERROR = 500;
  static const int HTTP_500_INTERNAL_ERROR = 500;

  /** HTTP Status-Code: 501 (Not Implemented) */
  static const int HTTP_NOT_IMPLEMENTED = 501;
  static const int HTTP_501_NOT_IMPLEMENTED = 501;

  /** HTTP Status-Code: 502 (Bad Gateway) */
  static const int HTTP_BAD_GATEWAY = 502;
  static const int HTTP_502_BAD_GATEWAY = 502;

  /** HTTP Status-Code: 503 (Service Unavailable) */
  static const int HTTP_UNAVAILABLE = 503;
  static const int HTTP_503_UNAVAILABLE = 503;

  /** HTTP Status-Code: 504 (Gateway Timeout) */
  static const int HTTP_GATEWAY_TIMEOUT = 504;
  static const int HTTP_504_GATEWAY_TIMEOUT = 504;

  /** HTTP Status-Code: 505 (HTTP Version Not Supported) */
  static const int HTTP_VERSION = 505;
  static const int HTTP_505_VERSION = 505;
}
