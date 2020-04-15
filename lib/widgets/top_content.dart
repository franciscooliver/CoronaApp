import 'package:corona_app/utils/navigator.dart';
import 'package:flutter/material.dart';

class TopContent extends StatelessWidget {
  final Image image;
  final String text1;
  final String text2;
  final String page;

  TopContent(
      {@required this.image,
      @required this.text1,
      @required this.text2,
      this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(24, 55, 168, 1.0),
            Color.fromRGBO(45, 105, 192, 1.0)
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 40.0,
            left: page == 'details' ? -60.0 : 25.0,
            child: this.image,
          ),
          Positioned(
            top: 100.0,
            right: 20.0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.text1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Google'),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    this.text2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Google'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            right: -15,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  page == 'details'
                      ? FlatButton(
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent, // button color
                              child: InkWell(
                                splashColor: Color.fromRGBO(
                                    45, 105, 192, 1.0), // inkwell color
                                child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  NavigatorApp.pop(context);
                                },
                              ),
                            ),
                          ),
                          onPressed: () {},
                        )
                      : SizedBox()
                  // FlatButton(
                  //   child: ClipOval(
                  //     child: Material(
                  //       color: Colors.transparent, // button color
                  //       child: InkWell(
                  //         splashColor: Color.fromRGBO(
                  //             45, 105, 192, 1.0), // inkwell color
                  //         child: SizedBox(
                  //           width: 56,
                  //           height: 56,
                  //           child: Image.asset('assets/images/icon_menu.png'),
                  //         ),
                  //         onTap: () {},
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
