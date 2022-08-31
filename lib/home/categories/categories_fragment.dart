import 'package:flutter/material.dart';

import 'category.dart';

class CategoriesFragment extends StatelessWidget {
  var categories = Category.getCategories();
  Function onCategoryClickCallBack;
  CategoriesFragment(this.onCategoryClickCallBack);
  @override
  Widget build(BuildContext context) {
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
                  onCategoryClickCallBack(categories[index]);
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
  static List<Category> getCategories(){
    return [
      Category('sports', 'Sports', Color(0xFFC91C22)),
      Category('general', 'General', Color(0xFF003E90)),
      Category('health', 'Health', Color(0xFFED1E79)),
      Category('business', 'Business', Color(0xFFCF7E48)),
      Category('technology', 'Technology', Color(0xFF4882CF)),
      Category('science', 'Science', Color(0xFFF2D352)),
    ];
  }
}
