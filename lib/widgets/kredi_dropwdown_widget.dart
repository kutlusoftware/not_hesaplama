import 'package:flutter/material.dart';
import 'package:not_hesaplama/Helper/data_helper.dart';
import 'package:not_hesaplama/constants/sabitler.dart';

class KrediDropwdownWidget extends StatefulWidget {
  final Function onKrediSecildi;

  const KrediDropwdownWidget({super.key, required this.onKrediSecildi});

  @override
  State<KrediDropwdownWidget> createState() => _KrediDropwdownWidgetState();
}

class _KrediDropwdownWidgetState extends State<KrediDropwdownWidget> {
  double secilenKrediDegeri = 1;
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
        value: secilenKrediDegeri,
        items: DataHelper.dropDownKrediMenuBilgisi(),
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
          });
        },
      ),
    );
  }
}
