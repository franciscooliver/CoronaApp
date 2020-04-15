import 'package:corona_app/consts.dart';
import 'package:corona_app/prevention_details.dart';
import 'package:corona_app/utils/clipper.dart';
import 'package:corona_app/utils/navigator.dart';
import 'package:corona_app/widgets/top_content.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _body(),
    );
  }

  _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new ClipPath(
            clipper: MyClipper(),
            child: TopContent(
                image: Image.asset(
                  'assets/images/coronadr.png',
                  width: 300.0,
                ),
                text1: 'Conhecer mais',
                text2: 'Sobre Covid-19.',
                page: 'details'),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.670,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Text(
                      'Sintomas',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 130.0,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      left: marginLeft - 15, right: marginRight - 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List<Widget>.generate(3, (index) {
                      return Container(
                        width: 100.0,
                        height: 111.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [Shadow().defaultShadow],
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Helper().getImageCard(index),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              Helper().getDescription(index),
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Text(
                      'Prevenção',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _generateCard(
                  imageUrl: 'assets/images/enfer01.png',
                  title: 'Usar máscara',
                  description:
                      'Desde o início do surto de coronavírus, alguns lugares adotaram completamente o uso de máscaras faciais, e qualquer pessoa apanhada sem o risco de se tornar uma pária social',
                      indexCard: 0
                ),
                _generateCard(
                  imageUrl: 'assets/images/enfer02.png',
                  title: 'Lavar as mãos',
                  description:
                      'Lave com frequência as mãos até a altura dos punhos, com água e sabão, ou então higienize com álcool em gel 70%.',
                      indexCard: 1
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _generateCard({String imageUrl, title, description, indexCard}) {
    final shadow = Shadow();

    return Container(
      width: double.infinity,
      height: 136.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
          boxShadow: [shadow.defaultShadow]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            imageUrl,
            width: 130.0,
            alignment: Alignment(-1.0, -1.0),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      letterSpacing: 0.8),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  description,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 11.0),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.0,
                    color: Color.fromRGBO(51, 130, 204, 1.0),
                  ),
                  onPressed: () {
                    NavigatorApp.push(context, PreventionDetails(indexCard));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Shadow {
  get defaultShadow => BoxShadow(
        color: Colors.grey.withOpacity(.2),
        blurRadius: 20.0, // soften the shadow
        spreadRadius: 0.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 10 Vertically
        ),
      );
}
