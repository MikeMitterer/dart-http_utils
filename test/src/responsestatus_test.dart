import 'dart:core';

import 'package:test/test.dart';

import 'package:http_utils/http_utils.dart';

main() {

  group('ResponseStatus', () {

    test('> toString', () {
      expect(ResponseStatus.CREATED.toString(),"Created");
      expect(ResponseStatus.CREATED.name,"CREATED");
      expect(ResponseStatus.CREATED.family,ResponseStatusFamily.SUCCESSFUL);
      expect(ResponseStatus.CREATED.reason,"Created");
      });
    
    test('> fromStatusCode', () {
      expect(ResponseStatus.fromStatusCode(200),ResponseStatus.OK);
      }); 
    
    test('> valueOf', () {
      expect(ResponseStatus.valueOf("CREATED"),ResponseStatus.CREATED);
      });  
    
    test('> valueOf with Exception', () {
      final Function callback = expectAsync((final StateError e) => expect(true,isTrue));
      
      try {
        ResponseStatus.valueOf("HudriWudri");
      } on StateError catch (e) { 
        callback(e);        
      }
      
    });    
    
  }); // group: ResponseStatus
  
  group('ResponseStatusFamily', () {

    test('> toString', () {
      expect(ResponseStatusFamily.CLIENT_ERROR.toString(),"CLIENT_ERROR");
      });
    
    test('> name', () {
      expect(ResponseStatusFamily.CLIENT_ERROR.name,"CLIENT_ERROR");
      });
    
    test('> values', () {
      expect(6,ResponseStatusFamily.values().length);
      expect(ResponseStatusFamily.values().first.name,"COMMUNICATION_FAILED");
      });
    
    test('> valueOf', () {
      expect(ResponseStatusFamily.valueOf("successful"),ResponseStatusFamily.SUCCESSFUL);
      });  
    
    test('> valueOf with Exception', () {
      final Function callback = expectAsync((final StateError e) => expect(true,isTrue));
      
      try {
        ResponseStatusFamily.valueOf("HudriWudri");
      } on StateError catch (e) { 
        callback(e);        
      }
      
    });
  }); // group: ResponseStatusFamily
}
