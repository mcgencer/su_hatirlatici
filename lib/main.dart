import 'package:flutter/material.dart';

void main() {
  runApp(SuHatirlatici());
}

class SuHatirlatici extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: AnaSayfa(),
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Widget> suBardak = [];
  int icilenSu = 0;
  int kalanBardak = 16;
  List hangiYuz = [
    Icon(
      Icons.mood_bad,
      color: Colors.red,
      size: 65,
    )
  ];

  void butonFonksiyonu(int kalanBardak) {
    if (kalanBardak == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Bravo testi başarı ile bitirdiniz ☺"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Başa Dön 👈"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            height: 200,
            child: Center(
              child: Wrap(
                runSpacing: 5,
                spacing: 50,
                children: suBardak,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Hedefe Kalan Bardak \n\n $kalanBardak",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Container(
                    child: hangiYuz[0],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "İçilen Toplam Su Miktarı \n\n $icilenSu ml / 3200 ml",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Container(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          suBardak.add(
                            Icon(Icons.opacity,
                                color: Colors.lightBlueAccent, size: 50),
                          );
                          icilenSu = icilenSu + 200;
                          kalanBardak--;
                          if (kalanBardak <= 8) {
                            hangiYuz = [
                              Icon(Icons.mood, color: Colors.green, size: 65)
                            ];
                          }
                          if (kalanBardak == 0) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: new Text(
                                      "Günlük alman gereken su miktarını tamamladın. \nTebrikler!  🎉  🙌",
                                    ),
                                    actions: <Widget>[
                                      new FlatButton(
                                        child: new Text("Sıfırla 👈"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            suBardak = [];
                                            kalanBardak = 16;
                                            icilenSu = 0;
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }

                        });
                      },
                      child: Icon(
                        Icons.opacity,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
