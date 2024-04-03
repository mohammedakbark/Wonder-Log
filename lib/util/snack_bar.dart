import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/style.dart';

errorSnackBar(context, message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}

successSnackBar(context, message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
    ),
  );
}

showLoadingIndicator(context, String data) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: TRANSPERENT,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            data,
            style: normalStyle(
                color: WHITE, fontWeight: FontWeight.w600, fontsize: 22),
          ),
          const SizedBox(
            width: 20,
          ),
          const CircularProgressIndicator(
            color: APP_THEME_COLOR,
          ),
        ],
      ),
    ),
  );
}
