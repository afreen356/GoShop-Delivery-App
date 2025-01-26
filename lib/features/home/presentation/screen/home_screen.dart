import 'package:flutter/material.dart';
import 'package:machine_task/features/home/domain/model/category_model.dart';
import 'package:machine_task/features/home/presentation/screen/notification_screen.dart';
import 'package:machine_task/features/home/presentation/widgets/appbar.dart';
import 'package:machine_task/features/home/presentation/widgets/stores.dart';
import 'package:machine_task/features/home/presentation/widgets/trending.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final List<String> images = [
    'assets/food.png',
    'assets/medicine.png',
    'assets/Vector.png',
    'assets/gifts.png',
    'assets/chicken.png',
    'assets/makeUp.png',
    'assets/instruments.png',
    'assets/Group 51.png'
  ];
  final List<String> titles = [
    'Food Delivery',
    'Medicines',
    'Pet Supplies',
    'Gifts',
    'Meat',
    'Cosmetics',
    'Stationary',
    'Stores'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
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
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey),
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Colors.green),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications_outlined, color: Colors.red),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.local_offer_outlined,
                      color: Colors.orangeAccent),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'What would you like to do today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(height: 280, child: Stack(children:[ buildCategoryItem(),])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.green,
                )
              ],
            ),
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
                children: [
                  buildHeader('Trending'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
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
                children: [
                  buildHeader('Nearby stores'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
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


  Widget customButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: const Text(
        'View all stores',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

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
                  color: Colors.white,
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

  Widget buildHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildTopPicks() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 0,
            child: Image.asset(
              'assets/image.png',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'DISCOUNT\n25% ALL\nFRUITS',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Center(child: Text('Check Now'))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTrending() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Row(
          children: [
            Image.asset(
              'assets/ice cream.png',
              height: 120,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

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
                                      color: Colors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.orange,
                              )
                            ],
                          )
                        ],
                      ),
                    ])));
          }),
    );
  }

  Widget offerBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Refer & Earn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Invite your friends & earn 15% off',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                    size: 16,
                  ),
                ),
              ),
              Image.asset(
                'assets/gift.png',
                width: 60,
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
