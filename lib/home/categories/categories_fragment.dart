
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'category.dart';

class CategoriesFragment extends StatefulWidget {
  Function onCategoryClickCallBack;
  CategoriesFragment(this.onCategoryClickCallBack);

  @override
  State<CategoriesFragment> createState() => _CategoriesFragmentState();
}

class _CategoriesFragmentState extends State<CategoriesFragment> {


  @override
  Widget build(BuildContext context) {
    var categories = Category.getCategories(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: .95
          ),
          itemBuilder: (_,index){
            return InkWell(
                onTap: (){
                  widget.onCategoryClickCallBack(categories[index]);
                },
                child: CategoryWidget(categories[index],index)) ;
          },itemCount: categories.length,),
    );
  }
}
class Category{
  String id;
  String title;
  Color color;

  Category(this.id, this.title, this.color);
  static List<Category> getCategories(BuildContext context){
    return [
      Category('sports', AppLocalizations.of(context)!.sports, Color(0xFFC91C22)),
      Category('general', AppLocalizations.of(context)!.genral, Color(0xFF003E90)),
      Category('health', AppLocalizations.of(context)!.health, Color(0xFFED1E79)),
      Category('business', AppLocalizations.of(context)!.business, Color(0xFFCF7E48)),
      Category('technology', AppLocalizations.of(context)!.technology, Color(0xFF4882CF)),
      Category('science', AppLocalizations.of(context)!.science, Color(0xFFF2D352)),
    ];
  }
}
