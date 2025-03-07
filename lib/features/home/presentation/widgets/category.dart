 import 'package:flutter/material.dart';
import 'package:machine_task/features/home/domain/model/category_model.dart';
import 'package:machine_task/features/home/presentation/widgets/colors/colors.dart';

Widget buildCategoryItem() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6),
      itemCount: categoryData.length,
      itemBuilder: (context, index) {
       final  data = categoryData[index];
        return Stack(
          children:[ Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Appcolors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    data.image,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
               data.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          getOfferText(index)
          ]
        );
      },
    );
  }
   Widget getOfferText(int index) {
    return categoryData[index].offer != ""
        ? Positioned(
            right: 5,
            top: 3,
            child: Container(
                height: 15,
                padding: const EdgeInsets.only(left: 5, right: 5,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(
                    255,
                    157,
                    55,
                    237,
                  ),
                ),
                child: Text(
                  categoryData[index].offer,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                )),
          )
        : Container();
  }

