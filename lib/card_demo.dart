//! Card
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:sangsin/utils/app_styles.dart";

class card_special extends StatelessWidget {
  const card_special({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Gesture Detected!')));
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.basic,
          onHover: ,
          child: Container(
              height: 140,
              width: 140,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(
                      color: AppTheme.accent,
                      width: 1.5,
                    )),
                elevation: 10,
                color: Color.fromARGB(255, 46, 46, 46),
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        IconData(
                          0xeb93,
                          fontFamily: 'MaterialIcons',
                        ),
                        color: AppTheme.accent,
                        size: 55),
                    Text(
                      "รูปนิ้ว",
                      // style: TextStyle(
                      //     fontSize: 15,
                      //     color: AppTheme.white,
                      //     fontFamily: 'Hind',),

                      style: GoogleFonts.sarabun(
                        textStyle: TextStyle(
                            color: AppTheme.white,
                            letterSpacing: .5,
                            fontSize: 13),
                      ),
                    ),
                    // Text(
                    //   'Identify\nPicture',
                    //   style: GoogleFonts.ibmPlexSans(),
                    // ),
                  ],
                )),
              )),
        ),
      ),
    );
  }
}
