import 'package:flutter/material.dart';
import 'package:not_hesaplama/Helper/data_helper.dart';
import 'package:not_hesaplama/constants/sabitler.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  //Callback fonk. veri gönderilcek yere yazılır.
  const HarfDropdownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade50,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        focusColor: Colors.transparent,
        underline: Container(),
        value: secilenHarfDegeri,
        items: DataHelper.dropDownMenuBilgisi(),
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            //arayuzdeki güncellemeyi sağlar.
            widget.onHarfSecildi(deger);
          });
        },
      ),
    );
  }
}
