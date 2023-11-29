import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 100,
    );
  }
}
