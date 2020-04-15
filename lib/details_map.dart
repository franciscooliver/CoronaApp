import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsMap extends StatefulWidget {
  final url;
  DetailsMap(this.url);

  @override
  _DetailsMapState createState() => _DetailsMapState();
}

class _DetailsMapState extends State<DetailsMap> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RotatedBox(
          quarterTurns: 1,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: WebView(
                  initialUrl: this.widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (v) {
                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ),
              Container(
                height: 50,
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
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text('Propagação do vírus pelo mundo', style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              Positioned(
                  left: 280,
                  top: 180,
                  child: loading
                      ? CircularProgressIndicator(
                          strokeWidth: 2.0,
                        )
                      : Container())
            ],
          ),
        ),
      ),
    );
  }
}
