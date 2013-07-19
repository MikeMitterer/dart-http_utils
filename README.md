Over time this should become a collection of useful HTTP-Tools...

* [API Reference][4]
* [Issues][5]

If the documenation links don't not work - pls. got to [GitHub][9] - there it they'll work

## URIBuilder ##
Helps you to compose URIs.<br>
Dart Documentation fur URIBuilder is [here][6]
 
For further documentation please refere to the [Unit-Tests][1].<br>
ApiDoc for Apaches [URIBuilder][3]

## HTTPStatus ##
Brings status-code to a more readable form.
Dart Documentation fur HTTPStatus is [here][7] 
([Unit-Tests][2])

http_utils on [PUB][8]

###History###
* 1.1.1 - Its possible to generate a local-file urls (relative path)
* 1.1.1 - Test for WebSocket-Scheme added
* 1.1.0 - RestUrl provides you with some default settings for your server and generats Urls, Uris or URIBuilder
* 1.0.7 - "build" builds the Uri now with the supplied values. It replaces any URI template parameter with the values "toString" method

###License###

    Copyright 2013 Michael Mitterer, IT-Consulting and Development Limited,
    Austrian Branch

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, 
    software distributed under the License is distributed on an 
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
    either express or implied. See the License for the specific language 
    governing permissions and limitations under the License.
    
If this plugin is helpful for you - please [(Circle)](http://gplus.mikemitterer.at/) me.

[1]: https://github.com/MikeMitterer/dart-http_utils/blob/master/test/src/uribuilder_test.dart
[2]: https://github.com/MikeMitterer/dart-http_utils/blob/master/test/src/httpstatus_test.dart
[3]: http://hc.apache.org/httpcomponents-client-ga/httpclient/apidocs/org/apache/http/client/utils/URIBuilder.html
[4]: http://htmlpreview.github.io/?https://raw.github.com/MikeMitterer/dart-http_utils/master/lib/docs/httputils.html
[5]: https://github.com/MikeMitterer/dart-http_utils/issues
[6]: http://htmlpreview.github.io/?https://raw.github.com/MikeMitterer/dart-http_utils/master/lib/docs/httputils/URIBuilder.html
[7]: http://htmlpreview.github.io/?https://raw.github.com/MikeMitterer/dart-http_utils/master/lib/docs/httputils/HttpStatus.html
[8]: http://pub.dartlang.org/packages/http_utils
[9]: https://github.com/MikeMitterer/dart-http_utils