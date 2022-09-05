import 'package:flutter/material.dart';
import 'package:newsapp/settings/Language_bottom_cheet.dart';

class SettingsFragment extends StatefulWidget {

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Language'),
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
              child: Text('English'),
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
