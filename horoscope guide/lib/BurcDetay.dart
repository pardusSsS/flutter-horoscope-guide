import 'package:burc_rehberi/burc_list.dart';
import 'package:burc_rehberi/models/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/burc.dart';
import 'burc_list.dart';
import 'dart:math' as math;
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletGenerator=PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenBurc.burcBuyukResim));

    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint("secilen renk: "+ paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,//title yukarıya sabitler
            primary: true,
            expandedHeight: 150,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink ,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenBurc.burcBuyukResim,fit: BoxFit.cover,),
              // title: Text(secilenBurc.burcAdi+ "Burcu ve Özellikleri"),
              centerTitle: true,
            ),
          ),

          SliverToBoxAdapter(
            child:SingleChildScrollView(

              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Container(child: Text(secilenBurc.burcDetayi,style: TextStyle(fontSize: 20),),color: randRenk(),),
            ),
          )
        ],
      ),
    );
  }

  Color randRenk(){
    return Color.fromARGB(math.Random().nextInt(255), math.Random().nextInt(255), math.Random().nextInt(255), math.Random().nextInt(255));
  }
}
