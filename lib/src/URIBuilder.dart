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

class URIBuilder {

    Map<String,String> queryParams = new Map<String,String>();
    
    String _scheme = "http";
    String _userInfo = "";
    String _host = "";
    String _path = "";
    String _fragment = "";
    
    int port = 0;

    URIBuilder() {
      
    }
    
    URIBuilder.fromString(final String string) {
        _digestURI(Uri.parse(string));
    }

    URIBuilder.fromUri(final Uri uri) {
        _digestURI(uri);
    }

    
    /**
     * Build a URI, using the supplied values in order to replace any URI template parameters. 
     * Values are converted to String using their toString function
     * 
     *     URIBuilder uribuilder = new URIBuilder.fromString("/test/{folder}/file.html");
     *     Uri uri = uribuilder.build(values: { "folder":"sub"});
     *     expect(uri.path,"/test/sub/file.html");
     */
    Uri build({final Map<String,dynamic> values: const {},final bool encode: true}) {
      if(values.length > 0) { _replacePathWithValues(values); }
      final Uri uri = new Uri(
          scheme: _scheme,
          userInfo: _userInfo,
          host: _host,
          port: port,
          path: _path,
          queryParameters: queryParams,
          fragment: _fragment
          );
      return encode ? Uri.parse(Uri.encodeFull(uri.toString())) : uri;
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
        this._scheme = scheme;
        return this;
    }

    /**
     * Sets Uri user-info in a form of 'username:password'.
     */
    URIBuilder setUserInfo(final String username, final String password) {
      this._userInfo = "$username:$password";
      return this;
    }

    /**
     * Sets Uri host.
     */
    URIBuilder setHost(final String host) {
        this._host = host;
        return this;
    }

    /**
     * Sets Uri port.
     */
    URIBuilder setPort(final int port) {
        this.port = port < 0 ? 0 : port;
        return this;
    }

    /**
     * Sets Uri path.
     */
    URIBuilder setPath(final String path) {
        this._path = path; 
        return this;
    }

    /**
     * Removes all query parameters.
     */
    URIBuilder removeQuery() {
        this.queryParams.clear();
        return this;
    }

    /**
     * Set Uri query.
     */
    URIBuilder setQuery(final String query) {
        queryParams = new Map<String,String>.from(_parseQuery(query));
        return this;
    }

    /**
     * Sets parameter-value pair to Uri query removing existing parameters with the same name.
     */
    URIBuilder setParameter(final String name, final String value) {
        this.queryParams[name] =  value;
        return this;
    }


    /**
     * Sets Uri fragment.
     */
    URIBuilder setFragment(final String fragment) {
        this._fragment = fragment;
        return this;
    }

    //---------------------------------------------------------------------------------------------
    // private
    //---------------------------------------------------------------------------------------------
    
    Map<String,String> _parseQuery(final String query) {
        final Map<String,String> nvps = new Map<String,String>();
        
        if (query != null && query.length > 0) {
            final List<String> namevalues = query.split("&");
            for(final String namevalue in namevalues) {
              final List<String> pair = namevalue.split("=");
              if(pair.length == 2) {
                nvps[pair[0]] = pair[1];
              }
            }
        }
        return nvps;
    }
 
    void _digestURI(final Uri uri) {
        this._scheme = uri.scheme;
        this._host = uri.host;
        this.port = uri.port;
        this._userInfo = "";
        this._path = uri.path;
        this._fragment = uri.fragment;
        
        this.queryParams = new Map<String,String>.from(uri.queryParameters);
    } 
    
    void _replacePathWithValues(final Map<String,dynamic> values) {
      for(final String key in values.keys) {
        _path = _path.replaceAll("\{$key\}", values[key].toString());      
      }
    }
}
