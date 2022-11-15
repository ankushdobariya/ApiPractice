import 'package:flutter/material.dart';

class SizeData
{
  static double? width,height,stHeight,btHeight,appHeight,bdHeight;
  SizeData(BuildContext context)
  {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    stHeight=MediaQuery.of(context).padding.top;
    btHeight=MediaQuery.of(context).padding.bottom;
    appHeight=kToolbarHeight;
    bdHeight=height!-stHeight!-btHeight!-appHeight!;

  }

}