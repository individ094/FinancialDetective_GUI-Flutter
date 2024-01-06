import 'package:bank_dashboard/ui/shared/colors.dart';
import 'package:bank_dashboard/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import mainviewmodel.dart
import 'package:bank_dashboard/views/main/main_viewmodel.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kTertiaryColor5,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const Icon(
                  Icons.account_balance_rounded,
                  color: kBlackColor,
                ),
                Expanded(
                  child: Text(
                    'Transactions Detective',
                    style: kHeading3TextStyle,
                  ),
                )
              ],
            ),
          ),
          DrawerListTile(
            title: "  Home",
            icon: Icons.home,
            press: () {
              if (ModalRoute.of(context)?.settings.name != '/home') {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              } else {
                Navigator.pop(context);
              }
            },
          ),
          DrawerListTile(
            title: "  Import Data (CSV)",
            icon: Icons.add_chart,
            press: () {
              if (ModalRoute.of(context)?.settings.name != '/ImportData') {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ImportData');
              } else {
                Navigator.pop(context);
              }
            },
          ),
          DrawerListTile(
            title: "  Cards",
            icon: Icons.card_giftcard,
            press: () {},
          ),
          DrawerListTile(
            title: "  Transaction",
            icon: Icons.transform,
            press: () {},
          ),
          DrawerListTile(
            title: "  Statistics",
            icon: Icons.calculate,
            press: () {},
          ),
          DrawerListTile(
            title: "  Settings",
            icon: Icons.settings,
            press: () {},
          ),
          DrawerListTile(
            title: "  Logout",
            icon: Icons.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: kBlackColor,
      ),
      title: Text(
        title,
        style: const TextStyle(color: kBlackColor),
      ),
    );
  }
}
