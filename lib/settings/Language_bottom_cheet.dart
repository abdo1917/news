import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

class Language_Bottom_Sheet extends StatefulWidget {

  @override
  State<Language_Bottom_Sheet> createState() => _Language_Bottom_SheetState();
}

class _Language_Bottom_SheetState extends State<Language_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {

    var settingProvider= Provider.of<setting_providers>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(onTap: (){settingProvider.changeLanguage('en');},
              child:
              settingProvider.current_language=='en'?
              getSelectedItem(AppLocalizations.of(context)!.english)
                  :getUnselectedItem(AppLocalizations.of(context)!.english)),
          SizedBox(height: 12,),
          InkWell(onTap: (){settingProvider.changeLanguage('ar');},
              child:
              settingProvider.current_language == 'ar'?
              getSelectedItem(AppLocalizations.of(context)!.arabic)
                  :getUnselectedItem(AppLocalizations.of(context)!.arabic))
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
