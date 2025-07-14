import 'package:flutter/material.dart';
import 'package:not_hesaplama/Helper/data_helper.dart';
import 'package:not_hesaplama/Model/ders.dart';
import 'package:not_hesaplama/constants/sabitler.dart';

class DersListesi extends StatelessWidget {
  Function onElemanCikarildi;
  DersListesi({super.key, required this.onElemanCikarildi});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenecekDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onElemanCikarildi(index);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.white),
                      SizedBox(width: 4),
                      Text("Siliniyor..."),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          tumDersler[index].ad,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${tumDersler[index].krediDegeri} kredi, Not Değeri: ${tumDersler[index].harfDegeri}",
                        ),
                        leading: CircleAvatar(
                          radius: 36,
                          backgroundColor: Sabitler.anaRenk.shade600,
                          child: Text(
                            (tumDersler[index].harfDegeri *
                                    tumDersler[index].krediDegeri)
                                .toStringAsFixed(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Container(
              child: Text(
                "Lütfen Ders Ekleyiniz",
                style: TextStyle(
                  color: Sabitler.anaRenk,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ElYazisi",
                ),
              ),
            ),
          );
  }
}
