part of httputils;

/*
 * ====================================================================
 *
 *  Licensed to the Apache Software Foundation (ASF) under one or more
 *  contributor license agreements.  See the NOTICE file distributed with
 *  this work for additional information regarding copyright ownership.
 *  The ASF licenses this file to You under the Apache License, Version 2.0
 *  (the "License"); you may not use this file except in compliance with
 *  the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 * ====================================================================
 *
 */


/// http://www.w3schools.com/tags/ref_urlencode.asp#encodingresult
class URIBuilder {
    static const int _SLASH = 0x2F;

    // NOTE: This code was ported from: closure-library/closure/goog/uri/utils.js
    static final RegExp _splitRe = new RegExp(
        '^'
        '(?:'
        '([^:/?#.]+)' // scheme - ignore special characters
        // used by other URL parts such as :,
        // ?, /, #, and .
        ':)?'
        '(?://'
        '(?:([^/?#]*)@)?' // userInfo
        '(?:'
        r'([\w\d\-\u0100-\uffff.%]*)'
        // host - restrict to letters,
        // digits, dashes, dots, percent
        // escapes, and unicode characters.
        '|'
        // TODO(ajohnsen): Only allow a max number of parts?
        r'\[([A-Fa-f0-9:.]*)\])'
        // IPv6 host - restrict to hex,
        // dot and colon.
        '(?::([0-9]+))?' // port
        ')?'
        r'([^?#[]+)?' // path
        r'(?:\?([^#]*))?' // query
        '(?:#(.*))?' // fragment
        r'$');

    static const _COMPONENT_SCHEME = 1;
    static const _COMPONENT_USER_INFO = 2;
    static const _COMPONENT_HOST = 3;
    static const _COMPONENT_HOST_IPV6 = 4;
    static const _COMPONENT_PORT = 5;
    static const _COMPONENT_PATH = 6;
    static const _COMPONENT_QUERY_DATA = 7;
    static const _COMPONENT_FRAGMENT = 8;

    Map<String, String> _queryParams = new Map<String, String>();

    String _scheme = "http";
    String _userInfo = "";
    String _host = "";
    String _path = "";
    String _fragment = "";

    int _port = 0;

    URIBuilder() {

    }

    URIBuilder.fromString(final String string) {
        //  _digestURI(Uri.parse(string));
        _digestURI(_fromMatch(_toMatch(string)));
    }

    URIBuilder.fromUri(final Uri uri) {
        _digestURI(uri);
    }

    URIBuilder.forFile(final String string) {
        _digestURI(new Uri.file(string));
    }

    /**
     * Build a URI, using the supplied values in order to replace any URI template parameters.
     * Values are converted to String using their toString function.
     * QueryParams are alphapetically sortet
     *
     *     URIBuilder uribuilder = new URIBuilder.fromString("/test/{folder}/file.html");
     *     Uri uri = uribuilder.build(values: { "folder":"sub"});
     *     expect(uri.path,"/test/sub/file.html");
     */
    Uri build({final Map<String, dynamic> values: const {
    }, final bool encode: false }) {
        if (values.length > 0) {
            _replacePathWithValues(values);
        }

        final Uri uri = new Uri(
            scheme: _scheme,
            userInfo: _userInfo,
            host: (_host != null && _host.isNotEmpty ? _host : null),
            port: (_port != null && _port > 0 ? _port : null),
            path: (path != null && path.isNotEmpty ? path : null),
            queryParameters: (query != null && query.isNotEmpty ? query : null),
            //path: _path,
            //queryParameters: _queryParams,

            fragment: (_fragment != null && _fragment.isNotEmpty ? _fragment : null)
        );

        return uri;
    }

    Uri decode() {
        return Uri.parse(Uri.decodeFull(build().toString()));
    }

    /// checks if the path is empty
    bool get isEmpty => _path.isEmpty;

    /// checks if the path is not empty
    bool get isNotEmpty => _path.isNotEmpty;

    /**
     * Sets Uri scheme.
     */
    URIBuilder setScheme(final String scheme) {
        _scheme = scheme;
        return this;
    }

    /**
     * Sets Uri user-info in a form of 'username:password'.
     */
    URIBuilder setUserInfo(final String username, final String password) {
        _userInfo = "$username:$password";
        return this;
    }

    /**
     * Sets Uri host.
     */
    URIBuilder setHost(final String host) {
        _host = host;
        return this;
    }

    /**
     * Sets Uri port.
     */
    URIBuilder setPort(final int port) {
        _port = port < 0 ? 0 : port;
        return this;
    }

    /**
     * Sets Uri path.
     */
    URIBuilder setPath(final String path) {
        _path = path;
        return this;
    }

    /**
     * Removes all query parameters.
     */
    URIBuilder removeQuery() {
        _queryParams.clear();
        return this;
    }

    /**
     * Set Uri query.
     */
    URIBuilder setQuery(final String query) {
        _queryParams = new Map<String, String>.from(_parseQuery(query));
        return this;
    }

    /**
     * Sets parameter-value pair to Uri query removing existing parameters with the same name.
     */
    URIBuilder setParameter(final String name, final String value) {
        _queryParams[name] = value;
        return this;
    }


    /**
     * Sets Uri fragment.
     */
    URIBuilder setFragment(final String fragment) {
        _fragment = fragment;
        return this;
    }

    String get scheme => _scheme;

    String get userInfo => _userInfo;

    String get host => _host;

    String get path => _getPath(false, _path);

    String get fragment => _fragment;

    int get port => _port;

    Map<String, String> get query => _getQuery(false, _queryParams);

    //---------------------------------------------------------------------------------------------
    // private
    //---------------------------------------------------------------------------------------------

    Map<String, String> get queryParams => _queryParams;

    Map<String, String> _parseQuery(final String query) {
        final Map<String, String> nvps = new Map<String, String>();

        if (query != null && query.length > 0) {
            final List<String> namevalues = query.split("&");
            for (final String namevalue in namevalues) {
                final List<String> pair = namevalue.split("=");
                if (pair.length == 2) {
                    nvps[pair[0]] = pair[1];
                }
            }
        }
        return nvps;
    }

    void _digestURI(final Uri uri) {
        _scheme = uri.scheme;
        _host = uri.host;
        _port = uri.port;
        _userInfo = "";
        _fragment = uri.fragment;
        _path = _getPath(false, uri.path);

        _queryParams.clear();
        _queryParams.addAll(_getQuery(false, uri.queryParameters));
    }

    void _replacePathWithValues(final Map<String, dynamic> values) {
        for (final String key in values.keys) {
            _path = _path.replaceAll("\{$key\}", values[key].toString());
        }
    }

    static Map<String, String> _getQuery(final bool encode, final Map<String, String> queryParams) {
        if (queryParams == null || queryParams.isEmpty) {
            return queryParams;
        }

        final Map<String, String> queryParamsEncoded = new Map<String, String>();

        // Sort key to get the same result in Dart and JS
        final List<String> keys = queryParams.keys.toList(growable: false)
            ..sort((final String e1, final String e2) => e1.compareTo(e2));

        for (final String key in keys) {
            // print("Key: $key");
            if (encode) {
                queryParamsEncoded[Uri.encodeQueryComponent(key)] = Uri.encodeQueryComponent(queryParams[key]);
            }
            else {
                //queryParamsEncoded[key] = _queryParams[key];
                queryParamsEncoded[Uri.decodeQueryComponent(key)] = Uri.decodeQueryComponent(queryParams[key]);
            }
        }

        // print(queryParamsEncoded);
        return queryParamsEncoded;
    }

    static String _getPath(final bool encode, final String path) {
        if (path == null || path.isEmpty) {
            return path;
        }

        final String pathToSplit = path.isNotEmpty && path.codeUnitAt(0) == _SLASH ? path.substring(1) : path;

        List<String> pathSegments;
        if (encode) {
            pathSegments = pathToSplit == "" ? const<String>[] : pathToSplit.split("/").map(Uri.encodeComponent).toList(growable: false);
        }
        else {
            pathSegments = pathToSplit == "" ? const<String>[] : pathToSplit.split("/").map(Uri.decodeComponent).toList(growable: false);
        }

        return (path.codeUnitAt(0) == _SLASH ? "/" : "") + pathSegments.join("/");
    }

    Match _toMatch(final String uri) {
        final Match m = _splitRe.firstMatch(uri);
        return m;
    }

    Uri _fromMatch(final Match match) {
        //      final Uri uri = new Uri(
        //          scheme: _emptyIfNull(match[_COMPONENT_SCHEME]),
        //          userInfo: _emptyIfNull(match[_COMPONENT_USER_INFO]),
        //          host: _eitherOf(match[_COMPONENT_HOST], match[_COMPONENT_HOST_IPV6]),
        //          port: _parseIntOrZero(match[_COMPONENT_PORT]),
        //          path: _emptyIfNull(match[_COMPONENT_PATH]),
        //          query: _emptyIfNull(match[_COMPONENT_QUERY_DATA]),
        //          fragment: _emptyIfNull(match[_COMPONENT_FRAGMENT])
        //          );

        final String host = _eitherOf(match[_COMPONENT_HOST], match[_COMPONENT_HOST_IPV6]);
        final Uri uri = new Uri(
            scheme: (match[_COMPONENT_SCHEME]),
            userInfo: (match[_COMPONENT_USER_INFO]),
            host: (host.isNotEmpty ? host : null),
            port: _parseIntOrNull(match[_COMPONENT_PORT]),
            path: (match[_COMPONENT_PATH]),
            query: (match[_COMPONENT_QUERY_DATA]),
            fragment: (match[_COMPONENT_FRAGMENT])
        );

        return uri;
    }

    static String _emptyIfNull(String val) => val != null ? val : '';

    static int _parseIntOrZero(String val) {
        if (val != null && val != '') {
            return int.parse(val);
        }
        else {
            return 0;
        }
    }

    static int _parseIntOrNull(String val) {
        if (val != null && val != '') {
            return int.parse(val);
        }
        else {
            return null;
        }
    }

    static String _eitherOf(String val1, String val2) {
        if (val1 != null) return val1;
        if (val2 != null) return val2;
        return '';
    }


}
