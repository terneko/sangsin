import 'package:flutter/material.dart';
import 'package:sangsin/card_demo.dart';
import 'package:sangsin/utils/app_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Column(
        children: [
          Row(
            children: [
              _mainButton(() => null, "New File"),
              Row(
                children: [
                  _actionButton(() => null, Icons.file_upload),
                  const SizedBox(width: 8),
                  _actionButton(() => null, Icons.folder),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
            child: Container(
                //  color: AppTheme.baby_blue,
                ),
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            SpecialCard(
              iconData: IconData(
                0xeb93,
                fontFamily: 'MaterialIcons',
              ),
              labelText: 'ID Photo',
              routePage: '/photo',
            ),
            SpecialCard(
              iconData: IconData(
                0xeb93,
                fontFamily: 'MaterialIcons',
              ),
              labelText: 'Image Picker',
              routePage: '/imagePicker',
            ),

            SizedBox(
              width: 20,
              child: Container(
                color: AppTheme.baby_blue,
              ),
            ),

            // const card_special(),
            // const card_special(),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            // const card_special(),
            SizedBox(
              width: 20,
            ),
            // const card_special(),
            // const card_special(),
            // const card_special(),
          ])
        ],
      ),
    );
  }

  ElevatedButton _mainButton(Function()? onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          backgroundColor: AppTheme.white,
          foregroundColor: AppTheme.dark

          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          // textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
          // {
          //  Color backgroundColor, // set the background color
          //  Color foregroundColor,
          //  Color disabledForegroundColor,
          //  Color shadowColor,
          //  double elevation,
          //  TextStyle textStyle,
          //  EdgeInsetsGeometry padding,
          //  Size minimumSize,
          //  BorderSide side,
          //  OutlinedBorder shape,
          //  MouseCursor enabledMouseCursor,
          //  MouseCursor disabledMouseCursor,
          //  VisualDensity visualDensity,
          //  MaterialTapTargetSize tapTargetSize,
          //  Duration animationDuration,
          //  bool enableFeedback
          //  }
          ),
      child: Text(text),
    );
  }

  IconButton _actionButton(Function()? onPressed, IconData icon) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 20,
      splashColor: AppTheme.accent,
      icon: Icon(
        icon,
        color: AppTheme.medium,
      ),
    );
  }
}
