import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerContent extends StatelessWidget {
  static const int SETTINGS = 1;
  static const int CATEGORIES =2;
  Function onMenuItemClick;
  DrawerContent(this.onMenuItemClick);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 64),
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          child: Text(AppLocalizations.of(context)!.news,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white
          ),),
        ),
        InkWell(
          onTap: (){
            onMenuItemClick(CATEGORIES);
          },
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/images/ic_list.png'),
              size: 48,),
              SizedBox(width: 12,),
              Text(AppLocalizations.of(context)!.categories,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
        InkWell(
          onTap: (){
            onMenuItemClick(SETTINGS);
          },
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/images/ic_settings.png'),
                size: 48,),
              SizedBox(width: 12,),
              Text(AppLocalizations.of(context)!.settings,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),)
            ],
          ),
        )
      ],
    );
  }
}
