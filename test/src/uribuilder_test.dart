part of test;

testURIBuilder() {

  group('URI Builder', () {
    final String host = "www.google.com";
    
    test('> Simple URL', () {
      final URIBuilder uribuilder = new URIBuilder();
      
      uribuilder.setHost(host);
      expect(uribuilder.build().toString(),"http://$host");
      
      uribuilder.setFragment("subsection");
      expect(uribuilder.build().toString(),"http://$host#subsection");   
      
      uribuilder.setPort(8080);
      expect(uribuilder.build().toString(),"http://$host:8080#subsection");
      
      uribuilder.setParameter("name", "UNKnown");
      uribuilder.setParameter("age", "99");
      expect(uribuilder.build().toString(),"http://$host:8080?name=UNKnown&age=99#subsection");
      
      uribuilder.setParameter("name", "Mike");
      expect(uribuilder.build().toString(),"http://$host:8080?name=Mike&age=99#subsection");
      });
    
    test('> Generate from String', () {
      URIBuilder uribuilder = new URIBuilder.fromString("http://$host");
      expect(uribuilder.build().toString(),"http://$host");
      
      uribuilder = new URIBuilder.fromString("http://$host/");
      expect(uribuilder.build().path,"/");      
      
      uribuilder = new URIBuilder.fromString("http://$host:8080?name=UNKnown&age=99#subsection");
      expect(uribuilder.build().path,"");
      expect(uribuilder.build().scheme,"http");
      expect(uribuilder.build().host,host);
      expect(uribuilder.build().port,8080);
      expect(uribuilder.build().queryParameters["age"],"99");
      });  
    
    test('> URLEncode', () {
      URIBuilder uribuilder = new URIBuilder.fromString("http://${host}/test /subfolder/file.html");
      expect(uribuilder.build().path,"/test%20/subfolder/file.html");
      expect(uribuilder.build(encode: false).path,"/test /subfolder/file.html");
      
      uribuilder = new URIBuilder.fromString("http://${host}/?age=>20");
      expect(uribuilder.build().path,"/");
      expect(uribuilder.build().queryParameters["age"],"%3E20");
      expect(Uri.decodeQueryComponent(uribuilder.build().queryParameters["age"]),">20");
      expect(uribuilder.decode().queryParameters["age"],">20");
      
      uribuilder = new URIBuilder.fromString("http://${host}/?age=%3E20");
      expect(uribuilder.build().queryParameters["age"],"%3E20");
      expect(Uri.decodeQueryComponent(uribuilder.build().queryParameters["age"]),">20");
      expect(uribuilder.decode().queryParameters["age"],">20");
      });        
  });
}

//------------------------------------------------------------------------------------------------
// Helper
//------------------------------------------------------------------------------------------------


