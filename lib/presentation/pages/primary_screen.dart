import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rant/controller/home_controller.dart';
import 'package:home_rant/core/constant/color_contant.dart';
import 'package:home_rant/presentation/pages/home_screen.dart';
import 'package:home_rant/presentation/pages/under_development_screen.dart';
import 'package:home_rant/presentation/widgets/drawer.dart';
import 'package:home_rant/presentation/widgets/drawer_items.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({super.key});

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  final drawerController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    drawerController.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          buildDrawer(),
          buildPage()
        ]
        ),
    );
  }
  Widget buildDrawer() => Obx( (){
    return Container(
      alignment: Alignment.centerLeft,
      width: drawerController.xOffset.value > 10 ? drawerController.xOffset.value - 10 : drawerController.xOffset.value,
      child: DrawerWidget(
         selectedItem: drawerController.selectedItem.value,
        onSelectedItem: (item) { 
          drawerController.onSelectedItem(item);
      },
      ),
    );
  }
    
  );


  Widget buildPage(){
    return Obx((){
      return PopScope(
      canPop: false,
    // ignore: deprecated_member_use
    onPopInvoked: (didPop) async {
      if (!didPop) {
        if (drawerController.isDrawerOpen.value) {
          drawerController.closeDrawer();
        } 
      }
    },
      child:GestureDetector(
          onTap: drawerController.closeDrawer,
          onHorizontalDragStart: (details) => drawerController.isDragging.value =true,
          onHorizontalDragUpdate: (details) {
            const delta = 1;
            if(details.delta.dx > delta){
              drawerController.openDrawer();
            }
            else if(details.delta.dx < -delta){
              drawerController.closeDrawer();
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            transform: Matrix4.translationValues(drawerController.xOffset.value, drawerController.yOffset.value, 0)..scale(drawerController.scaleFector.value),
            child: AbsorbPointer(
              absorbing: drawerController.isDrawerOpen.value,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(drawerController.isDrawerOpen.value? 20 : 0),
                child: currentPage()))),
      ),
    );
    });
  }

  Widget currentPage(){
    if(drawerController.selectedItem.value == DrawerItems.home){
      return HomePage();
    }else{
      return UnderDevelopmentPage();
    }
  }
}
