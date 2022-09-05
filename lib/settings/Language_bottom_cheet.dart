import 'package:flutter/material.dart';

class Language_Bottom_Sheet extends StatefulWidget {

  @override
  State<Language_Bottom_Sheet> createState() => _Language_Bottom_SheetState();
}

class _Language_Bottom_SheetState extends State<Language_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(onTap: (){},
              child:

              getSelectedItem('English')),
          SizedBox(height: 12,),
          InkWell(onTap: (){},
              child:
              getUnselectedItem('العربية'))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
        ),
        Icon(Icons.check_circle_rounded, )
      ],
    );
  }

  Widget getUnselectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, ),
      ],
    );
  }
}
