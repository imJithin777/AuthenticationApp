import 'package:authentication/app/ui/themes/my_colors.dart';
import 'package:flutter/material.dart';

Widget profileImage({required double radius}) {


  return  Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2,color: MyColors.white),
          color: MyColors.white
      ),
      child:  ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: const Icon(Icons.person, color: Colors.grey,size: 100,)
          )
    );
}



