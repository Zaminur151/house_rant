import 'package:home_rant/presentation/widgets/drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', iconPath: 'assets/images/icon_home.png');
  static const profile = DrawerItem(title: 'Profile', iconPath: 'assets/images/icon_contact.png');
  static const nearby = DrawerItem(title: 'Nearby', iconPath: 'assets/images/icon_location.png');
  static const bookmark = DrawerItem(title: 'Bookmark', iconPath: 'assets/images/icon_bookmark.png');
  static const notification = DrawerItem(title: 'Notification', iconPath: 'assets/images/icon_notification.png');
  static const message = DrawerItem(title: 'Message', iconPath: 'assets/images/icon_msg.png');
  static const setting = DrawerItem(title: 'Setting', iconPath: 'assets/images/icon_setting.png');
  static const help = DrawerItem(title: 'Help', iconPath: 'assets/images/icon_help.png');
  static const logout = DrawerItem(title: 'Logout', iconPath: 'assets/images/icon_logout.png');
  static final List all=[
    home,profile,nearby,bookmark,notification,message,setting,help,logout
  ];
}