import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/imageasset.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return Lottie.asset(AppImageAsset.lottieLoading1);
      case StatusRequest.offlineFailure:
        return Lottie.asset(AppImageAsset.lottieOffline);
      case StatusRequest.serverExeption:
        return Lottie.asset(AppImageAsset.lottieServer);
      case StatusRequest.serverFailure:
        return Lottie.asset(AppImageAsset.lottieServer);
      case StatusRequest.failure:
        return widget;
      case StatusRequest.success:
        return widget;
      case StatusRequest.none:
        return widget;
    }
  }
}
