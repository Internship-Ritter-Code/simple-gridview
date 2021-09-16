import 'dart:ui';

import 'package:flutter/material.dart';

class DetailViewPage extends StatefulWidget{
  String dnama,dgambar,dketerangan;
  DetailViewPage({this.dnama, this.dgambar, this.dketerangan});

  _DetailViewPage createState()=> _DetailViewPage();
}

class _DetailViewPage extends State<DetailViewPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPage'),
      ),
      body: ListView(
        children:<Widget>[
          Container(
            height: 240,
            child: new Hero(
                tag: widget.dnama,
                child: new Material(
                  child: InkWell(
                    child: Image.asset('gambar/${widget.dgambar}' , fit: BoxFit.contain,),
                  ),
                )
            ),
          ),
          new BagianNama(nama : widget.dnama),
          new BagianKeterangan(keterangan: widget.dketerangan,)
        ],
      ),
    );
    throw UnimplementedError();
  }

}

class BagianNama extends StatelessWidget{
  String nama;
  BagianNama({this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children:<Widget>[
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text("Honda@mail.com")
            ],
          )),
          Row(
            children:<Widget>[
              Icon(Icons.star),
              Text("9")
            ],
          )
        ],
      ),
    );
    throw UnimplementedError();
  }

}

class BagianKeterangan extends StatelessWidget{
  String keterangan;
  BagianKeterangan({this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('$keterangan', style: TextStyle(fontWeight: FontWeight.bold,), textAlign: TextAlign.justify,),
        ),
      ),
    );
    throw UnimplementedError();
  }
}


