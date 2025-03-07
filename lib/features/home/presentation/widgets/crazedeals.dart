
 import 'package:flutter/material.dart';
import 'package:machine_task/features/home/presentation/widgets/colors/colors.dart';

Widget crazeDeals() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 110,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Stack(children: [
                      Positioned(
                          bottom: -20,
                          right: -20,
                          child: Image.asset(
                            'assets/This Produce Delivery Service Wants You to Start Eating the _Ugly_ Vegetables Too 1.png',
                            height: 200,
                            width: 200,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 20),
                            child: Text(
                              'customer favourites\ntop supermakets',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  'Explore',
                                  style: TextStyle(
                                      color: Appcolors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color:Appcolors.orange
                              )
                            ],
                          )
                        ],
                      ),
                    ])));
          }),
    );
  }