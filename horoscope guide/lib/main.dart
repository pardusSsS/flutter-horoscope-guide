import 'package:burc_rehberi/BurcDetay.dart';
import 'package:flutter/material.dart';

import 'burc_list.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes:{
          "/" : (context) => BurcListesi(),
        },

        onGenerateRoute: (RouteSettings settings)
        {
          List<String> pathElemanlari = settings.name.split("/");
          if (pathElemanlari[1] == "burcDetay") {
            return MaterialPageRoute(
                builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
          }
          return null;
        },
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      title: "Burç Rehberi",
      // home: BurcListesi(),
    );
  }
}
