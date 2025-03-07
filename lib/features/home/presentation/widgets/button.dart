 import 'package:flutter/material.dart';
import 'package:machine_task/features/home/presentation/widgets/colors/colors.dart';

Widget customButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:Appcolors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: const Text(
        'View all stores',
        style: TextStyle(
          color: Appcolors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget button(){
    return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    color: Appcolors.green
                  ),
                ),
                Icon(
                  Icons.expand_more,
                  color: Appcolors.green
                )
    
    
              ]
    );
  }

  Widget textButton(){
    return  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.green),
                    ),
                  );
  }