import 'package:flutter/material.dart';
import 'package:flutter4_2/ui_view/detail_view.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class GridViewPage extends StatefulWidget{
  GridViewPage({Key key}) : super(key: key);
  _GridViewState createState() => _GridViewState();
}

const List<Key> keys =[
  Key("Network"),
  Key("NetworkDialog"),
  Key("Flare"),
  Key("FlareDialog"),
  Key("Asset"),
  Key("AssetDialog")
];

class _GridViewState extends State<GridViewPage>{
  //DataList
  List<Container> daftarGunung = new List();
  var itemDaftarGunung =[
    {"nama" : " Gunung1", "gambar": "g1_merapi.jpg", "keterangan": "Gunung Merapi"},
    {"nama" : " Gunung2", "gambar": "g2_salak.jpg", "keterangan": "Gunung Salak"},
    {"nama" : " Gunung3", "gambar": "g3_semeru.jpg", "keterangan": "Gunung Semeru"},
    {"nama" : " Gunung4", "gambar": "g4_slamet.jpg", "keterangan": "Gunung Slamet"},
  ];

  //Method
  _buatDataList() async{
    for (var i =0; i <itemDaftarGunung.length; i++ ){
      final dataGunung = itemDaftarGunung[i];
      final String gambarGunung = dataGunung["gambar"];

      daftarGunung.add(new Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: new InkWell(
            onTap: (){
              showDialog(context: context, builder: (_)=> AssetGiffyDialog(
                key: keys[5],
                  image: Image.asset('gambar/$gambarGunung', fit: BoxFit.contain,),
                  title: Text(dataGunung['nama'], style: TextStyle(fontWeight: FontWeight.bold),),
                description: Text(dataGunung['keterangan'], style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onOkButtonPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailViewPage(
                    dnama : dataGunung['nama'], dgambar : dataGunung['gambar'], dketerangan: dataGunung['keterangan'],
                  )));
                },
              ));
            },
            child: new Column(
              children:<Widget>[
                new Hero (tag: dataGunung["nama"],
                  child: new Image.asset('gambar/$gambarGunung', height: 85.0,width: 85.0,fit: BoxFit.contain,),),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(dataGunung['nama'],style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ));
    };
  }

  @override
  void initState(){
    super.initState();
    _buatDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('GridView'),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarGunung,
      ),
    );
    throw UnimplementedError();
  }
}