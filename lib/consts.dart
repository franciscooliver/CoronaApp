import 'package:flutter/material.dart';

const marginLeft = 20.0;
const marginRight = 20.0;
const urlApi = "https://coronavirusdata.herokuapp.com/";

class Helper {
  List<Image> images = [
    Image.asset('assets/images/grupo01.png', width: 70.0,),
    Image.asset('assets/images/grupo02.png', width: 70.0,),
    Image.asset('assets/images/grupo03.png', width: 70.0,)
  ];

  List<String> descriptions = [
    'Dor de cabeça', 'Tosse', 'Febre'
  ];

  getImageCard(int index) {
    return images[index];
  }
  getDescription(int index){
    return descriptions[index];
  }

  String format(double n) {
   return n.toStringAsFixed(0);
  }

}