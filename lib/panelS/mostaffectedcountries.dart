import 'package:covid_app/datasource.dart';
import 'package:flutter/material.dart';

class MostAffectedCountriesPanel extends StatelessWidget {
  final List mostAffectedCountriesData;

  const MostAffectedCountriesPanel({Key key, this.mostAffectedCountriesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Image.network(
                      mostAffectedCountriesData[index]["countryInfo"]["flag"],height: 30, width: 60,),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 100,
                    child: Text(mostAffectedCountriesData[index]["country"])),
                SizedBox(width: 30,),
                Text(
                  "Deaths:" + mostAffectedCountriesData[index]["deaths"].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
