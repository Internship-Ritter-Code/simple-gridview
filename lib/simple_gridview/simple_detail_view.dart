import 'package:flutter/material.dart';

class SimpleDetailView extends StatelessWidget {
  final bundleDataMotor;
  const SimpleDetailView({Key key, this.bundleDataMotor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPage'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 240,
            child: new Hero(
                tag: bundleDataMotor['nama'],
                child: new Material(
                  child: InkWell(
                    child: Image.asset(
                      'gambar/${bundleDataMotor["gambar"]}',
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
          ),
          new BagianNama(nama: bundleDataMotor['nama']),
          new BagianKeterangan(
            keterangan: bundleDataMotor['keterangan'],
          )
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  String nama;
  BagianNama({this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text("Honda@mail.com")],
          )),
          Row(
            children: <Widget>[Icon(Icons.star), Text("9")],
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  String keterangan;
  BagianKeterangan({this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            '$keterangan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
