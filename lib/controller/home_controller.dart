
import 'package:get/get.dart';
import 'package:home_rant/presentation/widgets/drawer_item.dart';
import 'package:home_rant/presentation/widgets/drawer_items.dart';

class HomeController extends GetxController{
  late RxDouble xOffset=0.0.obs;
  late RxDouble yOffset=0.0.obs;
  late RxDouble scaleFector = 0.0.obs;
  late RxBool isDrawerOpen = false.obs;
  RxBool isDragging = false.obs;
  RxInt currentIndex = 0.obs;
 // Rx<DrawerItem?> selectedItem = DrawerItems.all[0].obs;
  Rx<DrawerItem?> selectedItem = Rx<DrawerItem?>(DrawerItems.all[0]);



  
  void openDrawer() {
    xOffset.value = 200;
    yOffset.value = 85;
    scaleFector.value = 0.8;
    isDrawerOpen.value = true;
  }

  void closeDrawer() {
    xOffset.value = 0;
    yOffset.value = 0;
    scaleFector.value = 1;
    isDrawerOpen.value = false;
  }

  void onSelectedItem(DrawerItem item){
    selectedItem.value = item;
    closeDrawer();
  }

  void selectListTile(int index){
    currentIndex.value = index;
    update();
  }

}