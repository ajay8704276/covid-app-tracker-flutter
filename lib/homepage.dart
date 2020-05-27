import 'dart:convert';

import 'package:covid_app/datasource.dart';
import 'package:covid_app/pages/countrypage.dart';
import 'package:covid_app/panelS/infopanel.dart';
import 'package:covid_app/panelS/mostaffectedcountries.dart';
import 'package:covid_app/panelS/worldwidepanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorlWideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      //print(response.body);
      worldData = json.decode(response.body);
    });
  }

  List mostAffectedCountriesList = null;

  fetchMostAffectedCountriesData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      //print(response.body);
      mostAffectedCountriesList = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorlWideData();
    fetchMostAffectedCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Covid Tracker App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Covid info Text Container
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "World Wide",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Region",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Most Affected Countries",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            mostAffectedCountriesList == null
                ? Container()
                : MostAffectedCountriesPanel(
                    mostAffectedCountriesData: mostAffectedCountriesList,
                  ),
            SizedBox(
              height: 10,
            ),
            InfoPanel(),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  "WE ARE TOGETHER IN THIS FIGHT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: primaryBlack),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
