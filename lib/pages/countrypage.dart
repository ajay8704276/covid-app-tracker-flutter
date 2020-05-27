import 'dart:convert';

import 'package:covid_app/datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchCountryStatsData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      //print(response.body);
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryStatsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Stats"),
      ),
      body: countryData == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 120,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]),
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        //color: Colors.grey[50],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              countryData[index]["country"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                countryData[index]["countryInfo"]["flag"],
                                height: 40,
                                width: 60,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          //color: Colors.grey[50],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "CONFIRMED :" +
                                      countryData[index]["cases"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "ACTIVE :" +
                                      countryData[index]["active"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "RECOVERED :" +
                                      countryData[index]["recovered"]
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "DEATHS :" +
                                      countryData[index]["deaths"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
