import 'package:covid_app/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datasource.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => FAQs()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQs",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch("https://covid19responsefund.org/en/");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DONATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(
                  "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MYTH BUSTERS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
    );
  }
}
