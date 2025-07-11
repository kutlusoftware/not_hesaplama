import 'package:flutter/material.dart';
import 'package:not_hesaplama/Helper/data_helper.dart';
import 'package:not_hesaplama/Model/ders.dart';
import 'package:not_hesaplama/constants/sabitler.dart';
import 'package:not_hesaplama/widgets/ders_listesi.dart';
import 'package:not_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}
//Build olacaksa Widget olmalı.
// Eğer Sabit öğler varsa method olabilir.

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  final formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Sabitler.baslikText, style: Sabitler.baslikStyle),
        foregroundColor: Sabitler.baslikRengi,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              //Form Gelecek
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  ortalama: DataHelper.ortalamaHesapla(),
                  dersSayisi: DataHelper.tumEklenecekDersler.length,
                ),
              ),
            ],
          ),

          //Liste gelecek
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEklenecekDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //textFormField gelecek
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Harf DropDownButton Gelecek
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),

                  child: _builHarfler(),
                ),
              ),

              //Kredi DropDownButton Gelecek
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),

                  child: _buildKrediler(),
                ),
              ),
              //IconButton Gelecek
              IconButton(
                onPressed: () {
                  _dersEkleveOrtalamaHesapla();
                },
                icon: Icon(Icons.arrow_forward_ios),
                color: Sabitler.anaRenk,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextFormField(
        validator: (s) {
          if (s!.isEmpty) {
            return "DersAdını girin";
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          setState(() {
            girilenDersAdi = newValue!;
          });
        },
        decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
          filled: true,
          fillColor: Sabitler.anaRenk.shade50,
        ),
      ),
    );
  }

  _builHarfler() {
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
          });
        },
      ),
    );
  }

  _buildKrediler() {
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

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Ders eklencekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDegeri,
        krediDegeri: secilenHarfDegeri,
      );
      DataHelper.dersEkle(eklencekDers);
      setState(() {});
    }
  }
}
