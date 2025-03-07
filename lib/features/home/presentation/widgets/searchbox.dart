import 'package:flutter/material.dart';
import 'package:machine_task/features/home/presentation/widgets/colors/colors.dart';

Widget searchBox(BuildContext context){
  return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          // ignore: deprecated_member_use
                          fillColor: Colors.grey.withOpacity(0.2),
                          hintText: 'Search for products/stores',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Appcolors.green),
                    ),
                  ),
                ),
                Stack(
                  children:[ IconButton(
                    icon: Icon(Icons.notifications_outlined, color: Colors.red,size: 30,),
                    onPressed: () {
                     Navigator.pushNamed(context, '/notification');
                    },
                  ),
                   Positioned(
            right: 5,
            top: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
                  ]
                ),
                IconButton(
                  icon: Icon(Icons.local_offer_outlined,size: 30,
                      color:Appcolors.orange,
                      ),
                  onPressed: () {},
                ),
              ],
            );
}