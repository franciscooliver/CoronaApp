import 'package:corona_app/consts.dart';
import 'package:corona_app/details_map.dart';
import 'package:corona_app/details_page.dart';
import 'package:corona_app/utils/circle.dart';
import 'package:corona_app/utils/clipper.dart';
import 'package:corona_app/utils/navigator.dart';
import 'package:corona_app/widgets/top_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'models/paises.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String optionSelect;
  List<String> paisesNomes = List<String>();
  List<Map<String, dynamic>> listapaises = List<Map<String, dynamic>>();
  String totalCasos;
  String totalMortes;
  String totalCurados;
  String ultimaAtualizacao;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    setPaises();
    optionSelect = 'Brasil';
  }

  setPaises() async {
    try {
      var res = await http.get(urlApi);
      if (res.statusCode == 200) {
        final paises = convert.jsonDecode(res.body);
        setState(() {
          ultimaAtualizacao = paises['ultimaAtualizacao'].toString();
        });

        totalCasos = Helper().format(paises['paises']['Brazil']['totalCasos']);
        totalMortes =
            Helper().format(paises['paises']['Brazil']['totalMortes']);
        totalCurados =
            Helper().format(paises['paises']['Brazil']['totalCurados']);

        listapaises.add(paises['paises']);
        paises['paises'].forEach((k, v) {
          // print('v1: $k /// v2: $v');
          setState(() {
            paisesNomes.add(k);
          });
        });
      }
    } catch (e) {
      print(e);
    }
  }

  _onChange(v) {
    // print('Oiii $listapaises["Brazil"]')
    listapaises.map((pais) {
      for (var val in pais.keys) {
        if (val == v) {
          setState(() {
            totalCasos = Helper().format(pais[val]['totalCasos']);
            totalMortes = Helper().format(pais[val]['totalMortes']);
            totalCurados = Helper().format(pais[val]['totalCurados']);
          });
        }
      }
    }).toList();

    setState(() {
      optionSelect = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _body(),
    );
  }

  _body() {
    return Container(
      height: MediaQuery.of(context).size.height * 1.280,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new ClipPath(
            clipper: MyClipper(),
            child: TopContent(
              image: Image.asset(
                'assets/images/Drcorona.png',
                width: 200.0,
              ),
              text1: 'Tudo que você precisa',
              text2: 'é ficar em casa.',
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.670,
            child: ListView(
              children: <Widget>[
                _dropdown(),
                Container(
                    height: 70.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              'Atualização de caso',
                              style: TextStyle(
                                  color: Color.fromRGBO(48, 48, 48, 1.0),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8),
                            ),
                            subtitle: Text(
                              'Atualização mais recente ${ultimaAtualizacao != null ? ultimaAtualizacao : ""}',
                              style: TextStyle(
                                  color: Color.fromRGBO(149, 149, 149, 1.0)),
                            ),
                          ),
                        ),
                        FlatButton(
                          color: Colors.transparent,
                          padding: EdgeInsets.only(right: 0.0),
                          splashColor: Colors.transparent,
                          child: Text(
                            'Prevenção',
                            style: TextStyle(
                                color: Color.fromRGBO(51, 130, 204, 1.0),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsPage()));
                          },
                        )
                      ],
                    )),
                Container(
                  height: 110.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      left: marginLeft, right: marginRight, top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 20.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: _contentCard(),
                ),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.only(
                      left: marginLeft, right: 5.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Propagação do vírus',
                          style: TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1.0),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              letterSpacing: 0.8),
                        ),
                      ),
                      FlatButton(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(0.0),
                        splashColor: Colors.transparent,
                        child: Text(
                          'Veja detalhes',
                          style: TextStyle(
                              color: Color.fromRGBO(51, 130, 204, 1.0),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          NavigatorApp.push(
                              context,
                              DetailsMap(
                                  'https://www.google.com/maps/d/embed?mid=1S0vCi3BA-7DOCS13MomK7KebkPsvYl8C'));
                        },
                      )
                    ],
                  ),
                ),
                _map(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _map() {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: 10.0,
          ),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: WebView(
            initialUrl:
                'https://www.google.com/maps/d/u/0/embed?mid=1S0vCi3BA-7DOCS13MomK7KebkPsvYl8C',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: 10.0,
          ),
          height: 45.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(24, 55, 168, 1.0),
                  Color.fromRGBO(45, 105, 192, 1.0)
                ],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.fullscreen,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  NavigatorApp.push(
                      context,
                      DetailsMap(
                          'https://www.google.com/maps/d/embed?mid=1S0vCi3BA-7DOCS13MomK7KebkPsvYl8C'));
                },
              )
            ],
          ),
        ),
      ],
    );
    // return Container(
    //   height: 150,
    //   width: double.infinity,
    //   margin: const EdgeInsets.only(
    //     left: marginLeft,
    //     right: marginRight,
    //     top: 10.0,
    //   ),
    //   padding: const EdgeInsets.all(20.0),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(.2),
    //         blurRadius: 20.0, // soften the shadow
    //         spreadRadius: 0.0, //extend the shadow
    //         offset: Offset(
    //           5.0, // Move to right 10  horizontally
    //           5.0, // Move to bottom 10 Vertically
    //         ),
    //       )
    //     ],
    //   ),
    //   child: Image.asset(
    //     'assets/images/map.png',
    //     fit: BoxFit.cover,
    //   ),
    // );
  }

  _contentCard() {
    final tMortes = totalMortes != null ? totalMortes : '0';
    final tCurados = totalCurados != null ? totalCurados : '0';

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          totalCasos != null
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 23.0,
                        width: 23.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 186, 149, 0.26),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: CustomPaint(
                          painter: Circle(Color.fromRGBO(255, 135, 72, 1.0),
                              Offset(11.5, 11.5), 5.0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          totalCasos != null ? totalCasos.toString() : '0',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(255, 135, 72, 1.0)),
                        ),
                      ),
                      Text('Total de casos',
                          style: TextStyle(
                              color: Color.fromRGBO(149, 149, 149, 1.0)))
                    ],
                  ),
                )
              : CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
          totalMortes != null
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 23.0,
                        width: 23.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 110, 110, 0.26),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: CustomPaint(
                          painter: Circle(Color.fromRGBO(255, 72, 72, 1.0),
                              Offset(11.5, 11.5), 5.0),
                        ),
                      ),
                      Text(
                        tMortes,
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(187, 34, 33, 1.0)),
                      ),
                      Text('Total de mortes',
                          style: TextStyle(
                              color: Color.fromRGBO(149, 149, 149, 1.0)))
                    ],
                  ),
                )
              : CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
          totalCurados != null
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 23.0,
                        width: 23.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(98, 233, 89, 0.27),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: CustomPaint(
                          painter: Circle(Color.fromRGBO(54, 193, 44, 1.0),
                              Offset(11.5, 11.5), 5.0),
                        ),
                      ),
                      Text(
                        tCurados,
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(54, 193, 44, 1.0)),
                      ),
                      Text('Total de curados',
                          style: TextStyle(
                              color: Color.fromRGBO(149, 149, 149, 1.0)))
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Container _dropdown() {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        border:
            Border.all(color: Color.fromRGBO(229, 229, 229, 1.0), width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Color.fromRGBO(51, 130, 204, 1.0),
            ),
            Expanded(
              flex: 1,
              child: DropdownButton(
                // iconEnabledColor: Color.fromRGBO(51, 230, 204, 1.0),
                isExpanded: true,
                iconSize: 20.0,
                hint: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    optionSelect,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromRGBO(51, 130, 204, 1.0),
                ),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: paisesNomes
                    .map((value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: _onChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
