import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do App",
      home: Iskele(),

    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Listesi Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {

  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle(){
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar(){
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                itemCount: alisverisListesi.length,
                itemBuilder:(context, indexNo) => ListTile(
                  subtitle: Text("$indexNo. alınacak ürün"),
                  title: Text(alisverisListesi[indexNo]),
                ),
              )
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(
              onPressed: elemanEkle,
              child: Text("Ekle")
          ),
          ElevatedButton(
              onPressed: elemanCikar,
              child: Text("Sil")
          ),
        ],
      ),
    );
  }
}
