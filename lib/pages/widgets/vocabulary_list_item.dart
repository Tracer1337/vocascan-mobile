import 'package:flutter/cupertino.dart';
import 'package:vocascan_mobile/pages/widgets/text_field_container.dart';

class VocabularyListItem extends StatelessWidget{
  final headLine;

  const VocabularyListItem({Key? key, this.headLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: Row(children: <Widget>[
      Text(headLine)
    ],));
  }
  
  
}