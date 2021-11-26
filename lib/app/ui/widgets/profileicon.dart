import 'dart:io';
import 'package:authentication/app/ui/themes/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';




Widget profileImage({required double radius}) {


  return  Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2,color: MyColors.white),
          // borderRadius: BorderRadius.circular(70),
          color: MyColors.white
      ),
      child:  ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Icon(Icons.person, color: Colors.grey,size: 100,)
          )
    );
}



