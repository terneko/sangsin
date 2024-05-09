import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangsin/utils/app_styles.dart';

class SpecialCard extends StatelessWidget {
  final IconData iconData;
  final String labelText;

  const SpecialCard({
    Key? key,
    required this.iconData,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gesture Detected!')),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            height: 140, // Adjusted height to accommodate input field
            width: 140,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: BorderSide(
                  color: AppTheme.accent,
                  width: 1.5,
                ),
              ),
              elevation: 10,
              color: Color.fromARGB(255, 46, 46, 46),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      iconData,
                      color: AppTheme.accent,
                      size: 55,
                    ),
                    SizedBox(
                        height: 10), // Added space between icon and text field
                    Text(
                      labelText,
                      style: GoogleFonts.sarabun(
                        textStyle: TextStyle(
                          color: AppTheme.white,
                          letterSpacing: .5,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
