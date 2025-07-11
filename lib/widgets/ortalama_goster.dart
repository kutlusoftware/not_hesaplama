import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster({
    required this.ortalama,
    required this.dersSayisi,
    super.key,
  });
  //toStringAsFixed(2) ortalama sonrası son 2 rakamı gösterdi
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seçiniz",
          style: Sabitler.dersSayisiStyle,
        ),
        Text(
          ortalama > 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortlamaStyle,
        ),
        Text("Ortalama"),
      ],
    );
  }
}
