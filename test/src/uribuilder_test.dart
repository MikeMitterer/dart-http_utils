part of test;

testURIBuilder() {

    group('URI Builder', () {
        final String host = "www.google.com";

        test('> Uri', () {
            final String url = "http://www.google.com:8080?age=99&name=UNKnown#subsection";
            final Uri uri = Uri.parse(url);
            expect(uri.queryParameters["age"], "99");
        });

        test('> Simple URL', () {
            final URIBuilder uribuilder = new URIBuilder();

            uribuilder.setHost(host);
            //expect(uribuilder.build().toString(),"http://$host");

            uribuilder.setFragment("subsection");
            //expect(uribuilder.build().toString(),"http://$host#subsection");

            uribuilder.setPort(8080);
            //expect(uribuilder.build().toString(),"http://$host:8080#subsection");

            uribuilder.setParameter("age", "99");
            uribuilder.setParameter("name", "UNKnown");

            // Paramas should be sorted
            expect(uribuilder.build().toString(), "http://$host:8080?age=99&name=UNKnown#subsection");

            uribuilder.setParameter("name", "Mike");
            expect(uribuilder.build().toString(), "http://$host:8080?age=99&name=Mike#subsection");
        });

        test('> Generate from String', () {
            URIBuilder uribuilder = new URIBuilder.fromString("http://$host");
            expect(uribuilder.build().toString(), "http://$host");

            uribuilder = new URIBuilder.fromString("http://$host/");
            expect(uribuilder.build().path, "/");

            uribuilder = new URIBuilder.fromString("http://$host:8080?name=UNKnown&age=99#subsection");
            expect(uribuilder.build().path, "");
            expect(uribuilder.build().scheme, "http");
            expect(uribuilder.build().host, host);
            expect(uribuilder.build().port, 8080);
            expect(uribuilder.build().queryParameters["age"], "99");
        });

        test('> URLEncode', () {
            URIBuilder uribuilder = new URIBuilder.fromString("http://${host}/test /subfolder/file.html");
            expect(uribuilder.build().path, "/test%20/subfolder/file.html");
            expect(uribuilder.build(encode: false).path, "/test /subfolder/file.html");

            uribuilder = new URIBuilder.fromString("http://${host}/?age=>20");
            expect(uribuilder.build().path, "/");
            expect(uribuilder.build().queryParameters["age"], "%3E20");
            expect(Uri.decodeQueryComponent(uribuilder.build().queryParameters["age"]), ">20");
            expect(uribuilder.decode().queryParameters["age"], ">20");

            uribuilder = new URIBuilder.fromString("http://${host}/?age=%3E20");
            expect(uribuilder.build().queryParameters["age"], "%3E20");
            expect(Uri.decodeQueryComponent(uribuilder.build().queryParameters["age"]), ">20");
            expect(uribuilder.decode().queryParameters["age"], ">20");
        });

        test('> Path only', () {
            URIBuilder uribuilder = new URIBuilder.fromString("/test /subfolder/file.html");
            expect(uribuilder.build().path, "/test%20/subfolder/file.html");
            expect(uribuilder.build(encode: false).path, "/test /subfolder/file.html");

            uribuilder = new URIBuilder.fromString("/?age=>20");
            expect(uribuilder.build().path, "/");
            expect(uribuilder.build().queryParameters["age"], "%3E20");
            expect(Uri.decodeQueryComponent(uribuilder.build().queryParameters["age"]), ">20");
            expect(uribuilder.decode().queryParameters["age"], ">20");

            uribuilder = new URIBuilder.fromString("?age=%3E20");
            expect(uribuilder.build().queryParameters["age"], "%3E20");
            expect(Uri.decodeQueryComponent(uribuilder.build().queryParameters["age"]), ">20");
            expect(uribuilder.decode().queryParameters["age"], ">20");

            expect('', uribuilder.build().host);
        });

        test('> isEmpty', () {
            URIBuilder uribuilder = new URIBuilder.fromString("/test/subfolder/file.html");
            expect(uribuilder.isNotEmpty, isTrue);
        });

        test('> replace path', () {
            URIBuilder uribuilder = new URIBuilder.fromString("/test/{folder}/file.html");
            Uri uri = uribuilder.build(values: {
                "folder":"sub"
            });
            expect(uri.path, "/test/sub/file.html");

            URIBuilder resturi = new URIBuilder.fromString("/test/name/{id}");
            Uri uri2 = resturi.build(values: {
                "id":"10"
            });
            expect("/test/name/10",uri2.path);
        });

        test('> Uri (sorted)', () {
            final String url = "http://www.google.com:8080?name=UNKnown&age=99#subsection";
            final URIBuilder uribuilder = new URIBuilder.fromString(url);

            final Uri uri = uribuilder.build();
            print(uri.toString());
            expect(uri.toString(),"http://www.google.com:8080?age=99&name=UNKnown#subsection");
        });

    });
}

//------------------------------------------------------------------------------------------------
// Helper
//------------------------------------------------------------------------------------------------


