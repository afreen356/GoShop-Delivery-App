import 'package:flutter/material.dart';
import 'package:machine_task/features/home/presentation/widgets/appbar.dart';
import 'package:machine_task/features/home/presentation/widgets/button.dart';
import 'package:machine_task/features/home/presentation/widgets/category.dart';
import 'package:machine_task/features/home/presentation/widgets/colors/colors.dart';
import 'package:machine_task/features/home/presentation/widgets/crazedeals.dart';
import 'package:machine_task/features/home/presentation/widgets/header.dart';
import 'package:machine_task/features/home/presentation/widgets/offerbox.dart';
import 'package:machine_task/features/home/presentation/widgets/searchbox.dart';
import 'package:machine_task/features/home/presentation/widgets/stores.dart';
import 'package:machine_task/features/home/presentation/widgets/text.dart';
import 'package:machine_task/features/home/presentation/widgets/topicks.dart';
import 'package:machine_task/features/home/presentation/widgets/trending.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        backgroundColor: Appcolors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            searchBox(context),
            SizedBox(
              height: 20,
            ),
            headingText(),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 280,
                child: Stack(children: [
                  buildCategoryItem(),
                ])),
            button(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildHeader('Top picks for you'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: buildTopPicks(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildHeader('Trending'), textButton()],
              ),
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TrendingCard();
                    })),
            SizedBox(
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TrendingCard();
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: buildHeader('Craze deals'),
            ),
            SizedBox(
              height: 5,
            ),
            crazeDeals(),
            SizedBox(
              height: 15,
            ),
            offerBox(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildHeader('Nearby stores'), textButton()],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 300, child: BuildStoreItems()),
            SizedBox(height: 30),
            customButton(),
            SizedBox(height: 20),
          ],
        )));
  }
}
