import 'dart:convert';

import 'package:http/http.dart';
import 'package:simple_json_mapper/simple_json_mapper.dart';
import 'package:vocascan_mobile/exceptions/response_note_correct.dart';
import 'package:vocascan_mobile/services/storage.dart';

class ApiClientService<T>{
  String homeServer = "";
  static ApiClientService? instance;

  StorageService _storageService = StorageService.getInstance();
  Map<String, String> _headers = {
    "accept": "application/json",
    "Content-Type": "application/json"
  };


  ApiClientService(this.homeServer){
    instance = this;
    this.homeServer = this.homeServer + "/api/";
  }

  static ApiClientService getInstance(){
    return instance!;
  }

   Future<T?> endpointGet<T>(String endpoint) async {
   Uri url = Uri.parse(this.homeServer + endpoint);

    if(await _storageService.exists("token")){
      _headers["Authorization"] = "Bearer " + (await _storageService.get("token"))!;
    }

    Response response = await get(url, headers: _headers);

    if(response.statusCode != 200){
      throw EndpointResponseNotCorrect(response.statusCode);
    }

    final apiResult = JsonMapper.deserialize<T>(response.body);

    return apiResult;
  }

  Future<T?> endpointPost<T>(String endpoint, Map data) async {

    Uri url = Uri.parse(this.homeServer + endpoint);
    Response response = await post(url,headers: _headers,  body: utf8.encode(json.encode(data)));

    if(response.statusCode != 200){
      throw EndpointResponseNotCorrect(response.statusCode);
    }

    final apiResult = JsonMapper.deserialize<T>(response.body);

    return apiResult;
  }
}