import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:wanderlog/util/colors.dart';

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
    CustomSnackBar.error(
      message: message,
    ),
  );
}

showLoadingIndicator(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: TRANSPERENT,
      content: Row(
        children: [RefreshProgressIndicator()],
      ),
    ),
  );
}
