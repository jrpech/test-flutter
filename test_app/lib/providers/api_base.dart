import 'package:http/http.dart' as http;
import 'package:test_app/providers/payloads/error_response.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:collection';
import 'dart:async';
import 'errors.dart';
import 'dart:convert' as convert;

abstract class ApiBase {
  final Duration timeout;
  final String endPoint;

  ApiBase(String endPoint, {this.timeout = const Duration(seconds: 30)})
      : this.endPoint = endPoint;

  String serviceUrl(String apiCall) {
    return this.endPoint + "/" + apiCall;
  }

  Future<http.Response> get(String url) async {
    var headers = {
      'api_key': 'stage_HNYh3RaK_Test',
      'Content-Type': 'application/x-www-form-urlencoded',
      "Authorization":
          "Bearer XWtkk2t86Dr-BIDH9vhM-TLO4iR_OsF6c121cRggcIPUKV-_EI7yzpT6I2pFVQ8khmktgXBty4Hbkgj_CzZACzwK1BHv_GPwljKmTWhq-1Dba6p-9BPj8kmNiljy491Utkt4Ql2Sr9c8z3dOlWE6DnbPrCN-tov8f7KVsiyLq1h1HjU1TELUYq7GBx0wR1AGOmss-RqqyqzQ0NhsKfAp39lnwCYbFziyA8y0ceww1UdfDs0X126g3UUkk01pqoyqlQFi8pd66J4gtTNeBBOSrAOFl8FG0xFzjvayj8L2gxMyca9tLe5MCuX6JAu6mSZZ8V8GGNvTmIjr4zZpGPEwKBlFXqD0nFHKEVGsMCd6G5gB4VTBwSPgnzCNaQWXnqEwwZ1qaA"
    };

    final response =
        await http.get(serviceUrl(url), headers: headers).timeout(this.timeout);
    return validateResponse(response);
  }

  Future<http.Response> post(String url, dynamic body,
      {bool jsonEncode = true}) async {
    String payload = json.encode(body);

    //print(serviceUrl(url));

    /*var headers = {
      'api_key': 'stage_HNYh3RaK_Test',
      //'Content-Type': 'application/x-www-form-urlencoded'
    };*/

    if (!jsonEncode) {
      //this.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    }

    //print(this.headers);

    var headers = {
      'api_key': 'stage_HNYh3RaK_Test',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    final response = await http
        .post(
          serviceUrl(url),
          headers: headers,
          body: body,
        )
        .timeout(Duration(seconds: 35));

    print(response);
    return validateResponse(response);
  }

  http.Response validateResponse(http.Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return response;
    } else if (response.statusCode == HttpStatus.forbidden ||
        response.statusCode == HttpStatus.unauthorized) {
      throw ForbiddenError();
    } else if (response.statusCode == HttpStatus.badRequest) {
      Map<String, dynamic> json = jsonDecode(response.body.toString());
      ErrorResponse error = ErrorResponse.fromJson(json);
      throw ServerError(error.errorDescription, response.statusCode);
    } else {
      throw ServerError(response.body, response.statusCode);
    }
  }

  set token(String token) {
    //this.headers[HttpHeaders.authorizationHeader] = "Bearer " + token;
  }

  get token {
    //return this.headers[HttpHeaders.authorizationHeader];
  }
}
