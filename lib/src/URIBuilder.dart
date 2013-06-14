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
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 *
 */

/*
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
*/

/**
 * @since 4.2
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
     * Builds a Uri instance.
     */
    Uri build({final bool encode: true}) {
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
}
