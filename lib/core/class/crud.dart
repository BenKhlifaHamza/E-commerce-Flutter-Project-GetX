import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path/path.dart';

import '../functions/chackinternet.dart';
import 'statusrequest.dart';
import 'package:http/http.dart' as http;

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('YOUR_PHP_AUTH_USER:YOUR_PHP_AUTH_PW'))}';

Map<String, String> myheaders = {
  'content_type': 'application/json',
  'accept': 'application/json',
  'authorization': _basicAuth
};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    if (await checkInternet()) {
      try {
        var response =
            await http.post(Uri.parse(linkUrl), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          //  print(jsonDecode(response.body));
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        return const Left(StatusRequest.serverExeption);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
    //
    //
    //
    //
  }

  Future<Either<StatusRequest, Map>> postDataWithFiles(
      String url, Map data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request

    // Send Request
    var myrequest = await request.send();

    // For get Response Body
    var response = await http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
