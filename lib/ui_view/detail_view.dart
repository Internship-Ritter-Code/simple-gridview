import 'dart:ui';

import 'package:flutter/material.dart';

class DetailViewPage extends StatefulWidget{
  String dnama, dgambar, dketerangan;
  DetailViewPage({this.dnama, this.dgambar, this.dketerangan});

  _DetailViewPage createState() => _DetailViewPage();
}

class _DetailViewPage extends State<DetailViewPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children:<Widget>[
          Container(
            height: 240.0,
            child: new Hero(
              tag: widget.dnama,
              child: new Material(
                child: InkWell(
                  child: Image.asset('gambar/${widget.dgambar}', fit: BoxFit.contain,),
                ),
              ),
            ),
          ),
          new BagianNama(
            nama : widget.dnama
          ),
          new BagianIcon(),
          new BagianKeterangan(
            keterangan: widget.dketerangan
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}

class BagianNama extends StatelessWidget{
  BagianNama({this.nama});
  final String nama;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children:<Widget>[
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text(nama, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.green),),
              Text("$nama@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.green),)
            ],
          ),
          ),
          Row(
            children:<Widget>[
              Icon(Icons.star, size: 40.0, color: Colors.red,),
              Text("12", style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
    throw UnimplementedError();
  }
}

class BagianIcon extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children:<Widget>[
          IconTeks(iconData : Icons.camera, teks : "Camera"),
          IconTeks(iconData : Icons.message, teks : "Pesan"),
          IconTeks(iconData : Icons.phone, teks : "Phone")
        ],
      ),
    );
    throw UnimplementedError();
  }
}

class IconTeks extends StatelessWidget{
  IconTeks({this.iconData, this.teks});
  final IconData iconData;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children:<Widget>[
          Icon(iconData, size: 20.0, color: Colors.green,),
          Text(teks, style: TextStyle(fontSize: 12.0, color: Colors.green),)
        ],
      ),
    );
    throw UnimplementedError();
  }

}

class BagianKeterangan extends StatelessWidget{
  BagianKeterangan({this.keterangan});
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('$keterangan', style: TextStyle(fontSize: 14.0),textAlign: TextAlign.justify,),
        ),
      ),
    );
    throw UnimplementedError();
  }
}