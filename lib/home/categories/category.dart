import 'package:flutter/material.dart';

import 'categories_fragment.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight:Radius.circular(18),
          bottomRight:Radius.circular(index.isOdd?18:0),
          bottomLeft: Radius.circular(index.isEven?18:0)
        )
      ),
      child: Column(
        children: [
          Image.asset('assets/images/${category.id}.png',
          height: 120,),
          Text(category.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24
          ),)
        ],
      ),
    );
  }
}
