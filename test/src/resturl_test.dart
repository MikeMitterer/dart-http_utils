import 'dart:core';

import 'package:test/test.dart';

import 'package:http_utils/http_utils.dart';

class RestUrl8081 extends RestUrl {
  String get port => "8081"; 
  const RestUrl8081([final String scheme = "http"]) : super(scheme);
}

class RestLocalFile extends RestBuilder {
  String get port => "";
  String get host => "";
  const RestLocalFile() : super("","","data",".json");
  URIBuilder call([final String path = "" ,final Map<String,dynamic> params = const {}]) => new URIBuilder.forFile(toString(path,params));
}

main() {
  group('RestUrl', () { 
    group('RestUrl - basics', () {
  
      test(' -> basic', () {
        const RestUrl resturl = const RestUrl();
        expect(resturl(),"http://localhost:8080/api/v1");
        });
  
      test(' -> change default values', () {
        const RestUrl resturl = const RestUrl("https");
        expect(resturl(),"https://localhost:8080/api/v1");
        });
      
      test(' -> with path', () {
        const RestUrl resturl = const RestUrl("https");
        expect(resturl("/names"),"https://localhost:8080/api/v1/names");
        });   
      
      test(' -> with extension', () {
        const RestUrl resturl = const RestUrl.withExtension(".json");
        expect(resturl("/names"),"http://localhost:8080/api/v1/names.json");
        });   
      
      test(' -> authority', () {
        const RestUrl resturl = const RestUrl("http","MyName");
        expect(resturl("/names"),"http://MyName@localhost:8080/api/v1/names");
        });  
      
      test(' -> with template', () {
        const RestUrl resturl = const RestUrl();
        expect(resturl("/names/{name}"),"http://localhost:8080/api/v1/names/{name}");
        });       
      
      test(' -> with params', () {
        const RestUrl resturl = const RestUrl();
        expect(resturl("/names",{ "offset":0 , "limit" : 10 }),"http://localhost:8080/api/v1/names?offset=0&limit=10");
        });       
      
     }); // group RestUrl - basics'
    
    group('RestUrl change default values', () {
  
      test(' -> basic', () {
        const RestUrl resturl = const RestUrl8081();
        expect(resturl(),"http://localhost:8081/api/v1");
        });
      
      test(' -> change default values', () {
        const RestUrl resturl = const RestUrl8081("https");
        expect(resturl(),"https://localhost:8081/api/v1");
        });
      
      test(' -> Loal file', () {
        const RestBuilder resturl = const RestLocalFile();
        expect(resturl("/colors").build().toString(),"data/colors.json");
        });

     }); // group RestUrl change default values
    
    group('RestUri', () {
  
      test(' -> basic', () {
        const RestUri resturl = const RestUri();
        expect(resturl().toString(),"http://localhost:8080/api/v1");
        });
  
      test(' -> change default values', () {
        const RestUri resturl = const RestUri("https");
        expect(resturl().toString(),"https://localhost:8080/api/v1");
        });
      
      test(' -> with path', () {
        const RestUri resturl = const RestUri("https");
        expect(resturl("/names").toString(),"https://localhost:8080/api/v1/names");
        });   
      
      test(' -> with template', () {
        const RestUri resturl = const RestUri();
        expect(resturl("/name/{name}").toString(),"http://localhost:8080/api/v1/name/%7Bname%7D");

        // Funkt nicht!!!!
        //expect(resturl("/name/{name}",{ "name" : "Mike" }).toString(),"http://localhost:8080/api/v1/name/Mike");
        });
      
      test(' -> with params', () {
        const RestUri resturl = const RestUri();
        expect(resturl("/names",{ "offset":0 , "limit" : 10 }).toString(),"http://localhost:8080/api/v1/names?offset=0&limit=10");
        });       
      
     }); // group RestUri  
    
    group('RestBuilder', () {
  
      test(' -> basic', () {
        const RestBuilder resturl = const RestBuilder();
        expect(resturl().build().toString(),"http://localhost:8080/api/v1");
        });
  
      test(' -> change default values', () {
        const RestBuilder resturl = const RestBuilder("https");
        expect(resturl().build().toString(),"https://localhost:8080/api/v1");
        });
      
      test(' -> with path', () {
        const RestBuilder resturl = const RestBuilder("https");
        expect(resturl("/names").build().toString(),"https://localhost:8080/api/v1/names");
        });   
      
      test(' -> with template', () {
        const RestBuilder resturl = const RestBuilder();
        expect(resturl("/name/{name}").build(values: { "name": "Mike"}).toString(),"http://localhost:8080/api/v1/name/Mike");
        });       
      
      test(' -> with params', () {
        const RestBuilder resturl = const RestBuilder();
        expect(resturl("/names",{ "offset":0 , "limit" : 10 }).build().toString(),"http://localhost:8080/api/v1/names?limit=10&offset=0");
        });       
      
     }); // group RestBuilder    
  }); // group RestUrl    
}