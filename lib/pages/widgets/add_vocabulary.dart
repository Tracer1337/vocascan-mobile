import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vocascan_mobile/constants/colors.dart';
import 'package:vocascan_mobile/pages/widgets/rounded_button.dart';
import 'package:vocascan_mobile/pages/widgets/rounded_input_field.dart';
import 'package:vocascan_mobile/pages/widgets/text_field_container.dart';

class AddVocabularyPopup extends StatefulWidget{

  @override
  _AddVocabularyPopupState createState() => _AddVocabularyPopupState();
}

bool _selected = false;
List<Widget> _dynamicWidget = [];
int _translationCount = 0;

class _AddVocabularyPopupState extends State<AddVocabularyPopup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(child:  Container(
        width: size.width * 0.9,
        height: size.height *  0.51,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: SingleChildScrollView(child: Column(
          children: [
            TextFieldContainer(child: Text(tr("add_vocabulary"),
              style: TextStyle(fontSize: 20),),),
            TextFieldContainer(child: TextField(decoration: InputDecoration(
                hintText: tr("foreign_word")
            ),)),
            TextFieldContainer(child: TextField(decoration: InputDecoration(
                hintText: tr("translation"), suffixIcon: IconButton(onPressed: () {
                    addWidgetDynamic();
                  }, icon: Icon(Icons.add), color: primary,)
            ),),),
            Column(
              children: _dynamicWidget
            ),
            TextFieldContainer(child: TextField(decoration: InputDecoration(hintText: tr("package"),
                suffixIcon: IconButton(icon: Icon(_selected?Icons.keyboard_arrow_down: Icons.keyboard_arrow_up), onPressed: () {
                setState(() {
                  _selected = !_selected;
                });
              }, color: primary,)
            ),)),
            RoundedButton(text: tr("send"), press: (){

            })
        ]))
      ))
    );
  }

  addWidgetDynamic() {
    _translationCount += 1;
    setState(() {
      _dynamicWidget.add(TextFieldContainer(child: TextField(decoration: InputDecoration(
          hintText: tr("translation_count", args: [_translationCount.toString()]))
      )));
    });
  }
}
