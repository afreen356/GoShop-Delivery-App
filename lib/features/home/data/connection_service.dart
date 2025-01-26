import 'package:flutter/material.dart';
import 'package:machine_task/features/home/core/check_connection.dart';
import 'package:machine_task/features/home/data/api.dart';
import 'package:provider/provider.dart';


class ConnectionNotifier extends ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  Future<void> checkConnectionAndFetchNotifications(BuildContext context) async {
    bool isConnected = await ConnectionService().checkConnection();
    if (!isConnected) {
      _isConnected = false;
     
    } else {
      _isConnected = true;
      // Fetch notifications after checking connection
      await Provider.of<NoficationImplementantion>(context, listen: false)
          .fetchNotifications();
      notifyListeners();
    }
  }
}
