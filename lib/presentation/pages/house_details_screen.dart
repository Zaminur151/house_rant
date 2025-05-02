import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_rant/core/constant/color_contant.dart';

class HouseDetailPage extends StatelessWidget {
  const HouseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/house1.png",
                      height: 304,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                       onTap: () {
                        Get.back();
                       },
                      child: CircleAvatar(
                        // ignore: deprecated_member_use
                        backgroundColor:Colors.black.withOpacity(0.24),
                        child: SvgPicture.asset("assets/images/icon_back.svg")
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: CircleAvatar(
                      // ignore: deprecated_member_use
                      backgroundColor: Colors.black.withOpacity(0.24),
                      child: Icon(Icons.bookmark_border,color: AppColor.whiteColor,),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
            left: 0,
            right: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                       decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: LinearGradient(
                  // ignore: deprecated_member_use
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dreamsville House',
                            style: TextStyle(color: AppColor.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'JL Sultan Iskandar Muda, Jakarta selatan',
                            style: TextStyle(color: AppColor.whiteColor, fontSize: 12),
                          ),
                          SizedBox(height: 16,),
                          Row(
                      children: [
                        _iconText(Icons.king_bed, '6 Bedroom'),
                        const SizedBox(width: 16),
                        _iconText(Icons.bathtub, '4 Bathroom'),
                      ],
                    ),
                        ],
                      ),
                    ),
                  ),
               
                ],
              ),
              const SizedBox(height: 16),
        
              
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              RichText(text: TextSpan(text: "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... ",style: TextStyle(fontFamily: 'Raleway', color: AppColor.blackLight, fontSize: 12),
              children: [
                TextSpan(
                  text: "Show More",style: TextStyle(color: AppColor.primaryColor, fontSize: 12),
                )
              ]
              ),
              ),
              
              const SizedBox(height: 24),
        
              
              Row(
                children: [
                
                  const CircleAvatar(radius: 25, backgroundImage: AssetImage("assets/images/profile_pic.png")),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Garry Allen", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      Text("Owner", style: TextStyle(color: AppColor.blackLight, fontSize: 12)),
                    ],
                  ),
                  const Spacer(),
                  _actionIcon(Icons.phone),
                  const SizedBox(width: 8),
                  _actionIcon(Icons.chat_rounded),
                ],
              ),
              const SizedBox(height: 32),
        
              
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Gallery", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 72,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _galleryImage("assets/images/gallery1.png"),
                    _galleryImage("assets/images/gallery2.png"),
                    _galleryImage("assets/images/gallery3.png"),
                    _galleryImage("assets/images/gallery1.png", label: "+5"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/Map.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
          ),
          
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // ignore: deprecated_member_use
                    Colors.white.withOpacity(0), 
                    Colors.white,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price", style: TextStyle(color: AppColor.blackLight)),
                      SizedBox(height: 4),
                      Text(
                        "Rp. 2.500.000.000 / Year",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [AppColor.primaryLight,AppColor.primaryColor],begin: Alignment.topCenter, end: Alignment.bottomCenter)
                    ),
                    child: Text("Rent Now",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.whiteColor),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.20),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Icon(icon, color: Colors.white, size: 16)),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _actionIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:  BoxDecoration(
        color: AppColor.primaryLight,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Icon(icon, size: 16, color: AppColor.whiteColor),
    );
  }

  Widget _galleryImage(String path, {String? label}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(path, height: 72, width: 72, fit: BoxFit.cover),
          ),
          if (label != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            )
        ],
      ),
    );
  }
}
