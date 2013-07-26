part of httputils;

/// Commonly used status codes defined by HTTP
class ResponseStatus {
  static final List<ResponseStatus> _values = new List<ResponseStatus>();
  
  final String                _name;
  final ResponseStatusFamily  _family;
  final int                   _code;
  final String                _reason;
  
  const ResponseStatus(this._name,this._family,this._code,this._reason);
  
  /// Get the Status-Name as String
  String get                name => _name;
  
  /// Get the class of status code
  ResponseStatusFamily get  family => _family;
  
  /// Get the reason phrase
  String get                reason => _reason;
  
  /// Get the associated status code
  int get                   code => _code;
  
  /// Get the reason phrase
  String toString() => _reason;
  
  /** HTTP Status-Code: 0 (Communication failed) */
  static const ResponseStatus COMMUNICATION_FAILED = const ResponseStatus("COMMUNICATION_FAILED",ResponseStatusFamily.COMMUNICATION_FAILED,0,"Communication failed");
  
  /** HTTP Status-Code: 200 (OK) */
  static const ResponseStatus OK = const ResponseStatus("OK",ResponseStatusFamily.SUCCESSFUL,200,"OK");
  
  /** HTTP Status-Code: 201 (Created) */
  static const ResponseStatus CREATED = const ResponseStatus("CREATED",ResponseStatusFamily.SUCCESSFUL,201,"Created");

  /** HTTP Status-Code: 202 (Accepted) */
  static const ResponseStatus ACCEPTED = const ResponseStatus("ACCEPTED",ResponseStatusFamily.SUCCESSFUL,202,"Accepted");

  /** HTTP Status-Code: 203 (Non-Authoritative Information) */
  static const ResponseStatus NOT_AUTHORITATIVE = const ResponseStatus("NOT_AUTHORITATIVE",ResponseStatusFamily.SUCCESSFUL,203,"Non-Authoritative Information");

  /** HTTP Status-Code: 204 (No Content) */
  static const ResponseStatus NO_CONTENT = const ResponseStatus("NO_CONTENT",ResponseStatusFamily.SUCCESSFUL,204,"No Content");

  /** HTTP Status-Code: 205 (Reset Content) */
  static const ResponseStatus RESET = const ResponseStatus("RESET",ResponseStatusFamily.SUCCESSFUL,205,"Reset Content");

  /** HTTP Status-Code: 206 (Partial Content) */
  static const ResponseStatus PARTIAL = const ResponseStatus("PARTIAL",ResponseStatusFamily.SUCCESSFUL,206,"Partial Content");

  /** HTTP Status-Code: 300 (Multiple Choices) */
  static const ResponseStatus MULT_CHOICE = const ResponseStatus("MULT_CHOICE",ResponseStatusFamily.REDIRECTION,300,"Multiple Choices");

  /** HTTP Status-Code: 301 (Moved Permanently) */
  static const ResponseStatus MOVED_PERM = const ResponseStatus("MOVED_PERM",ResponseStatusFamily.REDIRECTION,301,"Moved Permanently");

  /** HTTP Status-Code: 302 (Temporary Redirect) */
  static const ResponseStatus MOVED_TEMP = const ResponseStatus("MOVED_TEMP",ResponseStatusFamily.REDIRECTION,302,"Temporary Redirect");

  /** HTTP Status-Code: 303 (See Other) */
  static const ResponseStatus SEE_OTHER = const ResponseStatus("SEE_OTHER",ResponseStatusFamily.REDIRECTION,303,"See Other");

  /** HTTP Status-Code: 304 (Not Modified) */
  static const ResponseStatus NOT_MODIFIED = const ResponseStatus("NOT_MODIFIED",ResponseStatusFamily.REDIRECTION,304,"Not Modified");

  /** HTTP Status-Code: 305 (Use Proxy) */
  static const ResponseStatus USE_PROXY = const ResponseStatus("USE_PROXY",ResponseStatusFamily.REDIRECTION,305,"Use Proxy");

  /** HTTP Status-Code: 400 (Bad Request) */
  static const ResponseStatus BAD_REQUEST = const ResponseStatus("BAD_REQUEST",ResponseStatusFamily.CLIENT_ERROR,400,"Bad Request");

  /** HTTP Status-Code: 401 (Unauthorized) */
  static const ResponseStatus SERVER_ERROR = const ResponseStatus("SERVER_ERROR",ResponseStatusFamily.CLIENT_ERROR,401,"Unauthorized");

  /** HTTP Status-Code: 402 (Payment Required) */
  static const ResponseStatus PAYMENT_REQUIRED = const ResponseStatus("PAYMENT_REQUIRED",ResponseStatusFamily.CLIENT_ERROR,402,"Payment Required");

  /** HTTP Status-Code: 403 (Forbidden) */
  static const ResponseStatus FORBIDDEN = const ResponseStatus("FORBIDDEN",ResponseStatusFamily.CLIENT_ERROR,403,"Forbidden");

  /** HTTP Status-Code: 404 (Not Found) */
  static const ResponseStatus NOT_FOUND = const ResponseStatus("NOT_FOUND",ResponseStatusFamily.CLIENT_ERROR,404,"Not Found");

  /** HTTP Status-Code: 405 (Method Not Allowed) */
  static const ResponseStatus BAD_METHOD = const ResponseStatus("BAD_METHOD",ResponseStatusFamily.CLIENT_ERROR,405,"Method Not Allowed");

  /** HTTP Status-Code: 406 (Not Acceptable) */
  static const ResponseStatus NOT_ACCEPTABLE = const ResponseStatus("NOT_ACCEPTABLE",ResponseStatusFamily.CLIENT_ERROR,406,"Not Acceptable");

  /** HTTP Status-Code: 407 (Proxy Authentication Required) */
  static const ResponseStatus PROXY_AUTH = const ResponseStatus("PROXY_AUTH",ResponseStatusFamily.CLIENT_ERROR,407,"Proxy Authentication Required");

  /** HTTP Status-Code: 408 (Request Time-Out) */
  static const ResponseStatus CLIENT_TIMEOUT = const ResponseStatus("CLIENT_TIMEOUT",ResponseStatusFamily.CLIENT_ERROR,408,"Request Time-Out");

  /** HTTP Status-Code: 409 (Conflict) */
  static const ResponseStatus CONFLICT = const ResponseStatus("CONFLICT",ResponseStatusFamily.CLIENT_ERROR,409,"Conflict");

  /** HTTP Status-Code: 410 (Gone) */
  static const ResponseStatus GONE = const ResponseStatus("GONE",ResponseStatusFamily.CLIENT_ERROR,410,"Gone");

  /** HTTP Status-Code: 411 (Length Required) */
  static const ResponseStatus LENGTH_REQUIRED = const ResponseStatus("LENGTH_REQUIRED",ResponseStatusFamily.CLIENT_ERROR,411,"Length Required");

  /** HTTP Status-Code: 412 (Precondition Failed) */
  static const ResponseStatus PRECON_FAILED = const ResponseStatus("PRECON_FAILED",ResponseStatusFamily.CLIENT_ERROR,412,"Precondition Failed");

  /** HTTP Status-Code: 413 (Request Entity Too Large) */
  static const ResponseStatus ENTITY_TOO_LARGE = const ResponseStatus("ENTITY_TOO_LARGE",ResponseStatusFamily.CLIENT_ERROR,413,"Request Entity Too Large");

  /** HTTP Status-Code: 414 (Request-URI Too Large) */
  static const ResponseStatus REQ_TOO_LONG = const ResponseStatus("REQ_TOO_LONG",ResponseStatusFamily.CLIENT_ERROR,414,"Request-URI Too Large");

  /** HTTP Status-Code: 415 (Unsupported Media Type) */
  static const ResponseStatus UNSUPPORTED_TYPE = const ResponseStatus("UNSUPPORTED_TYPE",ResponseStatusFamily.CLIENT_ERROR,415,"Unsupported Media Type");

  /** HTTP Status-Code: 500 (Internal Server Error) */
  static const ResponseStatus INTERNAL_ERROR = const ResponseStatus("INTERNAL_ERROR",ResponseStatusFamily.SERVER_ERROR,500,"Internal Server Error");

  /** HTTP Status-Code: 501 (Not Implemented) */
  static const ResponseStatus NOT_IMPLEMENTED = const ResponseStatus("NOT_IMPLEMENTED",ResponseStatusFamily.SERVER_ERROR,501,"Not Implemented");

  /** HTTP Status-Code: 502 (Bad Gateway) */
  static const ResponseStatus BAD_GATEWAY = const ResponseStatus("BAD_GATEWAY",ResponseStatusFamily.SERVER_ERROR,502,"Bad Gateway");

  /** HTTP Status-Code: 503 (Service Unavailable) */
  static const ResponseStatus UNAVAILABLE = const ResponseStatus("UNAVAILABLE",ResponseStatusFamily.SERVER_ERROR,503,"Service Unavailable");

  /** HTTP Status-Code: 504 (Gateway Timeout) */
  static const ResponseStatus GATEWAY_TIMEOUT = const ResponseStatus("GATEWAY_TIMEOUT",ResponseStatusFamily.SERVER_ERROR,504,"Gateway Timeout");

  /** HTTP Status-Code: 505 (HTTP Version Not Supported) */
  static const ResponseStatus VERSION = const ResponseStatus("VERSION",ResponseStatusFamily.SERVER_ERROR,505,"HTTP Version Not Supported");
  
  static List<ResponseStatus> values() {
    if(_values.length == 0) {
      _values.add(COMMUNICATION_FAILED);
      _values.add(OK);
      _values.add(CREATED);
      _values.add(ACCEPTED);
      _values.add(NOT_AUTHORITATIVE);
      _values.add(NO_CONTENT);
      _values.add(RESET);
      _values.add(PARTIAL);
      _values.add(MULT_CHOICE);
      _values.add(MOVED_PERM);
      _values.add(MOVED_TEMP);
      _values.add(SEE_OTHER);
      _values.add(NOT_MODIFIED);
      _values.add(USE_PROXY);
      _values.add(BAD_REQUEST);
      _values.add(SERVER_ERROR);
      _values.add(PAYMENT_REQUIRED);
      _values.add(FORBIDDEN);
      _values.add(NOT_FOUND);
      _values.add(BAD_METHOD);
      _values.add(NOT_ACCEPTABLE);
      _values.add(PROXY_AUTH);
      _values.add(CLIENT_TIMEOUT);
      _values.add(CONFLICT);
      _values.add(GONE);
      _values.add(LENGTH_REQUIRED);
      _values.add(PRECON_FAILED);
      _values.add(ENTITY_TOO_LARGE);
      _values.add(REQ_TOO_LONG);
      _values.add(UNSUPPORTED_TYPE);
      _values.add(INTERNAL_ERROR);
      _values.add(NOT_IMPLEMENTED);
      _values.add(BAD_GATEWAY);
      _values.add(UNAVAILABLE);
      _values.add(GATEWAY_TIMEOUT);
      _values.add(VERSION);
    }
    return _values;
  }
  
  /// Returns the constant value of this type with the specified name.
  static ResponseStatus valueOf(final String name) {
    if(name == null || name.isEmpty) {
      throw new ArgumentError("ResponseStatus-name must not be null or empty");
    }
    
    ResponseStatus status = values().firstWhere((final ResponseStatus element) => name.toUpperCase() == element.name);
    return status;
  }
  
  /// Convert a numerical status code into the corresponding Status
  static ResponseStatus fromStatusCode(final int statusCode) {
    if(statusCode < 0 || statusCode > 503) {
      throw new ArgumentError("Status-Code must be a positive value and must not be higher than 503 but was $statusCode");
    }    
    
    ResponseStatus status = values().firstWhere((final ResponseStatus element) => element.code == statusCode);
    return status;
  }
}

/**
 * An constant representing the class of status code
 * 
 * <a href="http://goo.gl/7p85Ff">JavaDoc</a>
 */
class ResponseStatusFamily {
  static final List<ResponseStatusFamily> _values = new List<ResponseStatusFamily>();
  final String _name;
  final int _value;
  
  const ResponseStatusFamily(this._name,this._value);
  
  static const ResponseStatusFamily COMMUNICATION_FAILED  = const ResponseStatusFamily("COMMUNICATION_FAILED",0);
  static const ResponseStatusFamily INFORMATIONAL         = const ResponseStatusFamily("INFORMATIONAL",100);
  static const ResponseStatusFamily SUCCESSFUL            = const ResponseStatusFamily("SUCCESSFUL",200);  
  static const ResponseStatusFamily REDIRECTION           = const ResponseStatusFamily("REDIRECTION",300);
  static const ResponseStatusFamily CLIENT_ERROR          = const ResponseStatusFamily("CLIENT_ERROR",400);
  static const ResponseStatusFamily SERVER_ERROR          = const ResponseStatusFamily("SERVER_ERROR",500);

  String get name => _name;
  int get value => _value;
  String toString() => _name;
  
  /// Returns a List containing the constants of type, in the order they are declared.
  static List<ResponseStatusFamily> values() {
    if(_values.length == 0) {
      _values.add(COMMUNICATION_FAILED);
      _values.add(INFORMATIONAL);
      _values.add(SUCCESSFUL);
      _values.add(REDIRECTION);
      _values.add(CLIENT_ERROR);
      _values.add(SERVER_ERROR);
    }
    
    return _values;
  }
  
  /// Returns the constant of this type with the specified name.
  static ResponseStatusFamily valueOf(final String name) {
    if(name == null || name.isEmpty) {
      throw new ArgumentError("ResponseStatusFamily-name must not be null or empty");
    }
    
    ResponseStatusFamily family = values().firstWhere((final ResponseStatusFamily element) => name.toUpperCase() == element.name);
    
    return family;
  }
}
