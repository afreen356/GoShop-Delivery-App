import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_task/features/home/domain/model/response_model.dart';

class NoficationImplementantion extends ChangeNotifier {

  List<Data> datas =[];


  Future<void> fetchNotifications() async {
    const String url =   'https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json';
   try {
     final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          final model = NotificationDataModel.fromJson(jsonResponse);
          datas =model.data??[];
          notifyListeners();
     
     
    } else {
      throw Exception("Failed to load notifications");
     
    }
   } catch (e) {
     log('Error fetching notification:$e');
     rethrow;
   }
   
   
  
  }
}
