import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_rant/controller/home_controller.dart';
import 'package:home_rant/core/constant/color_contant.dart';
import 'package:home_rant/presentation/pages/house_details_screen.dart';
import 'package:home_rant/presentation/widgets/best_houses_card.dart';
import 'package:home_rant/presentation/widgets/house_card.dart';


class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final drawerController = Get.find<HomeController>();


  final List<String> category = [
    'House',
    'Apartment',
    'Hotel',
    'Villa',
    'Cottage',
    
  ];

  final List<Map<String, String>> houses = [
    {
      
      "image": "assets/images/house1.png",
      "title": "Dreamsville House",
      "location": "JL Sultan Iskandar Muda",
      "distance": "1.8 km",
    },
    {
      "image": "assets/images/house2.png",
      "title": "Ascot House",
      "location": "JL Cilandak Tengah",
      "distance": "2.1 km",
    },
    {
      
      "image": "assets/images/house1.png",
      "title": "Dreamsville House",
      "location": "JL Sultan Iskandar Muda",
      "distance": "1.8 km",
    },
    {
      "image": "assets/images/house2.png",
      "title": "Ascot House",
      "location": "JL Cilandak Tengah",
      "distance": "2.1 km",
    },
  ];

      final  List<Map<String, dynamic>> bestHouseList = [
      {
        "image": "assets/images/house1.png",
        "title": "Orchad House",
        "price": "Rp. 2.500.000.000 / Year",
        "bedroom": 6,
        "bathroom": 4
      },
      {
        "image": "assets/images/house2.png",
        "title": "The Hollies House",
        "price": "Rp. 2.000.000.000 / Year",
        "bedroom": 5,
        "bathroom": 4
      },
      {
        "image": "assets/images/house1.png",
        "title": "Orchad House",
        "price": "Rp. 2.500.000.000 / Year",
        "bedroom": 6,
        "bathroom": 4
      },
      {
        "image": "assets/images/house2.png",
        "title": "The Hollies House",
        "price": "Rp. 2.000.000.000 / Year",
        "bedroom": 5,
        "bathroom": 4
      },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric( vertical: 16),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.blackLight ),),
                          Row(
                            children: [
                              Text("Jakarta ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                              SvgPicture.asset("assets/images/dropdown_icon.svg")
                          
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/images/notification.svg")
                    ],
                  ),
                ),
                SizedBox(height: 22,),
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                      height: 48,
                      width: 270,
                      child: TextField(
                        style: TextStyle(
                          color: const Color(0xff020202),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                        
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                          filled: true,
                          fillColor: AppColor.whiteLight,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search address, or near you ",
                          hintStyle: TextStyle(
                              color: AppColor.blackLight,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                              decorationThickness: 6),
                          prefixIcon: SizedBox(
                              width: 16, 
                              height: 16,
                              child: Padding(
                                padding: EdgeInsets.all(15), 
                                child: SvgPicture.asset(
                                  "assets/images/IC_Search.svg",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                        ),
                      ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [AppColor.primaryLight,AppColor.primaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/images/sortlist_icon.svg"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18,),
                SizedBox(
                  height: 41,
                  child: GetBuilder<HomeController>(
                    builder: (controller){
                      return ListView.builder(
                      scrollDirection: Axis.horizontal,
                            itemCount: category.length,
                            itemBuilder: (context, index) {
                               bool isSelected = index ==controller.currentIndex.value;
                              return GestureDetector(
                                onTap: 
                                (){ controller.selectListTile(index); },

                                child: Container(
                                  
                                  margin: EdgeInsets.only(left: index==0? 16:0, right: 12,top: 3,bottom: 3),
                                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                                  
                                  decoration: BoxDecoration(
                                    color: isSelected ? null : AppColor.whiteLight,
                                                         gradient: isSelected
                        ? LinearGradient(
                            colors: [AppColor.primaryLight, AppColor.primaryColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                  child: Center(
                                    child: Text(
                                                    category[index],
                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color:isSelected? AppColor.whiteColor:AppColor.blackLight),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                    },
                
                  ),
                ),
                SizedBox(height: 27,),
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Near from you",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      Text("See more",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.blackLight),),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HouseDetailPage()),
    );
  },
                  child: SizedBox(
                  height: 272,
                  child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 16),
                            itemCount: houses.length,
                            itemBuilder: (context, index) {
                              final house = houses[index];
                              return HouseCard(
                                image: house['image']!,
                                title: house['title']!,
                                location: house['location']!,
                                distance: house['distance']!,
                              );
                            },
                  ),
                                ),
                ),
              SizedBox(height: 32,),
              Padding(
                padding: EdgeInsets.symmetric( horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best for you",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      Text("See more",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.blackLight),),
                    ],
                  ),
              ),
                SizedBox(height: 8,),
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => HouseDetailPage());
                     },
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                            
                            itemCount: bestHouseList.length,
                            itemBuilder: (context, index) {
                              final house = bestHouseList[index];
                              return BestHouseTile(
                                imagePath: house['image']!,
                                title: house['title']!,
                                price: house['price']!,
                                bedrooms: house['bedroom'] as int,
                                bathrooms: house['bathroom'] as int,
                              );
                            },
                          ),
                  ),
                ),
              ],
            )
            ),
        )
      ),
    );
  }
}