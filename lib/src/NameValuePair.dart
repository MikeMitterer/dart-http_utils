part of httputils;

abstract class NameValuePair {
  final String _name;
  final String _value;
  
  NameValuePair(this._name,this._value);
  
  String getName() => _name;
  String getValue() => _value;
}

// Only for compatibility reasons...
class BasicNameValuePair extends NameValuePair {
  BasicNameValuePair(final String name,final String value) : super(name,value) {}
}