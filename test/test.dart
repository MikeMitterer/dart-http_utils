library test;

import 'dart:core';

//import 'dart:html'; // as html;
//import 'dart:collection';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'package:http_utils/http_utils.dart';

part 'src/httpstatus_test.dart';
part 'src/responsestatus_test.dart';
part 'src/uribuilder_test.dart';
part 'src/resturl_test.dart';
part 'src/DateUtils_test.dart';

//
// Mehr Infos: http://www.dartlang.org/articles/dart-unit-tests/
//
main() {
  useHtmlEnhancedConfiguration();
  
  testHTTPStatus();
  testResponseStatus();
  testURIBuilder();
  testRestUrl();
  testDateUtils();
}