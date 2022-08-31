import 'package:flutter/material.dart';

import '../../api/model/Sourcersreponse.dart';

class TabWidget extends StatelessWidget{
  Source source;
  bool isSelected;
  TabWidget(this.source,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor,
              width: 2),
          borderRadius: BorderRadius.circular(18),
          color: isSelected?Theme.of(context).primaryColor:Colors.transparent
      ),
      child: Text(source.name ??"",
        style: TextStyle(
            color: isSelected?Colors.white:Theme.of(context).primaryColor
        ),
      ),
    );
  }
}