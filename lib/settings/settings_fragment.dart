import 'package:flutter/material.dart';
import 'package:newsapp/settings/Language_bottom_cheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

class SettingsFragment extends StatefulWidget {

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize:24 ),),
          SizedBox(height: 4,),
          InkWell(
            onTap: (){
              showLanguageButtomSheet();
            },
            child: Container(

              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 1,),
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.all(8),
              child: Text(settingProvider.IsEn()?AppLocalizations.of(context)!.english
                  :AppLocalizations.of(context)!.arabic,style: TextStyle(fontSize:24 ),
                ),
            ),
          ),

        ],
      ),
    );
  }

  void showLanguageButtomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return Language_Bottom_Sheet();
    });
  }

}
