part of httputils;

/**
 * Provides some default-settings for your REST-Url
 */
abstract class AbstractRestUrl {
  final String _scheme;
  final String _pathPrefix;
  final String _extension;
  final String _userInfo;
  
  const AbstractRestUrl([this._scheme = "http",this._userInfo = "",this._pathPrefix = "/api/v1",this._extension = ""]);
  
  String get scheme     => _scheme;
  String get host       => "localhost";
  String get port       => "8080";
  
  String get pathPrefix => _pathPrefix;
  String get extension  => _extension;
  String get userInfo   => _userInfo;
  
  String get authority  => (userInfo.isNotEmpty ? "$userInfo@$host:$port" : "$host:$port");
  
  String toString([final String path = "" ,final Map<String,dynamic> params = const {}])  => _toString(path,params);
  
  //-----------------------------------------------------------------------------------------------
  // private
  //-----------------------------------------------------------------------------------------------
  
  String _toString(final String path,final Map<String,dynamic> params) {
    final StringBuffer uri = new StringBuffer();

    if(scheme.isNotEmpty) {
      uri.write("$scheme://");
    }

    if(authority.isNotEmpty && authority.length > 1) {
      uri.write("$authority");
    }

    if(pathPrefix.isNotEmpty) {
      uri.write("$pathPrefix");
    }

    if(path.isNotEmpty) {
      uri.write("$path");
    }

    if(extension.isNotEmpty) {
      uri.write(extension);
    }

    if(params.isNotEmpty) {
      uri.write("?");

      final List<String> kvPair = new List<String>();
      params.forEach((final String key,final dynamic value) => kvPair.add("$key=$value"));

      uri.write(kvPair.join("&"));
    }

    return uri.toString();
  }
}

/// Extends [AbstractRestUrl] with a call method for returning a [String] value
class RestUrl extends AbstractRestUrl {
  const RestUrl([final String scheme = "http", final String userinfo = "",final String pathPrefix = "/api/v1",final String extension = ""]) : super(scheme,userinfo,pathPrefix,extension);
  const RestUrl.withExtension(final String extension) : this("http","","/api/v1",extension);
  
  String call([final String path = "" ,final Map<String,dynamic> params = const {}]) => _toString(path,params);
}

/// Extends [AbstractRestUrl] with a call method for returning a [Uri] value
class RestUri extends AbstractRestUrl {
  const RestUri([final String scheme = "http",final String userinfo = "", final String pathPrefix = "/api/v1",final String extension = ""]) : super(scheme,userinfo,pathPrefix,extension);
  const RestUri.withExtension(final String extension) : this("http","","/api/v1",extension);
  
  Uri call([final String path = "" ,final Map<String,dynamic> params = const {}]) => Uri.parse(_toString(path,params));
}

/// Extends [AbstractRestUrl] with a call method for returning a [URIBuilder] value
class RestBuilder extends AbstractRestUrl {
  const RestBuilder([final String scheme = "http",final String userinfo = "", final String pathPrefix = "/api/v1",final String extension = ""]) : super(scheme,userinfo,pathPrefix,extension);
  const RestBuilder.withExtension(final String extension) : this("http","","/api/v1",extension);
  
  URIBuilder call([final String path = "" ,final Map<String,dynamic> params = const {}]) => new URIBuilder.fromString(_toString(path,params));
}

