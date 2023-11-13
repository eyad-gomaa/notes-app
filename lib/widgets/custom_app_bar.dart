import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
   const CustomAppBar({Key? key, required this.title, required this.appBarIcon, this.onTap}) : super(key: key);
final String title;
final Icon appBarIcon;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      child: Row(
        children:  [
          Text(title
              ,style: const TextStyle(fontSize: 35),
          ),
          const Spacer(),
           CustomSearchIcon( appBarIcon: appBarIcon,
           onTap: onTap,),
        ],
      ),
    );
  }
}

