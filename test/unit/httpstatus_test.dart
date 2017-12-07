import 'dart:core';

import 'package:test/test.dart';

import 'package:http_utils/http_utils.dart';

main() {

  group('HTTP Status', () {

    test('> Check OK Status', () {
      expect(200,HttpStatus.HTTP_200_OK);
      expect(200,HttpStatus.HTTP_OK);
      });
  });
}


