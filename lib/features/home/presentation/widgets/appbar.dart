import 'package:flutter/material.dart';

PreferredSizeWidget customAppbar(){
  return AppBar(
    
     backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on,size: 28, color: Colors.green),
            Text(
              "ABCD, New Delhi",
              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
        
      );
  
}