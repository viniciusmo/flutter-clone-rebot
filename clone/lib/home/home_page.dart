import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 18),
            _buildCard1(),
            SizedBox(height: 18),
            _buildCard2()
          ],
        ),
      ),
    );
  }

  Padding _buildCard2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Color(0xffe1e1e1), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 75,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/ic_orders.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Escola do Revendedor",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Treinamentos para você",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Image.asset('assets/placeholder_2.png',
                  height: 157, fit: BoxFit.fill),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Ver todos",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004f4f),
                                  fontFamily: "Domaine")),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Icon(Icons.arrow_forward, size: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 240,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Color(0xffe1e1e1), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/ic_orders.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Incentivos",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Image.asset('assets/placeholder_1.png',
                  height: 157, fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
