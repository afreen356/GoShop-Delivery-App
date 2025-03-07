import 'package:flutter/material.dart';
import 'package:machine_task/features/home/presentation/screen/home_screen.dart';
import 'package:machine_task/features/home/presentation/screen/notification_screen.dart';

class Routes{
  static final Map<String,WidgetBuilder> routes ={
    '/home': (context)=> HomeScreen(),
    '/notification':(context)=>NotificationScreen(),
  };
}