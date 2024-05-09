import 'package:flutter/material.dart';
import 'package:sangsin/utils/app_styles.dart';

class Photo extends StatelessWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      appBar: AppBar(
          title: Text('Personal Photo'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Column contents vertically,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Column contents horizontally,
                    children: [
                      Container(
                        width: 400,
                        height: 500,
                        color: AppTheme.white,
                        child: Icon(
                          IconData(
                            0xeb93,
                            fontFamily: 'MaterialIcons',
                          ),
                          color: AppTheme.accent,
                          size: 55,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 30,
                height: 30,
                color: AppTheme.baby_blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
