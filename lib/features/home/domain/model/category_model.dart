class Categories{
  final String image;
  final String title;
  final String offer;

  Categories({required this.image, required this.title,required this.offer});
}
   final categoryData =[
    Categories(image: 'assets/food.png', title: 'Food Delivery',offer: '10%off'),
     Categories(image: 'assets/medicine.png', title:'Medicines',offer: '10%off'),
      Categories(image: 'assets/Vector.png', title:  'Pet Supplies',offer: '10%off'),
       Categories(image: 'assets/gifts.png', title: 'Gifts',offer: ''),
        Categories(image:'assets/chicken.png', title: 'Meat',offer: ''),
         Categories(image: 'assets/makeUp.png', title: 'Cosmetics',offer: ''),
          Categories(image: 'assets/instruments.png', title: 'Stationary',offer: ''),
          Categories(image: 'assets/Group 51.png', title:'Stores',offer: '10%off')
 
   ];

