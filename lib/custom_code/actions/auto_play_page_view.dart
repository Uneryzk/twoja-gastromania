// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future autoPlayPageView(
  Future Function()? onNextPageRequired,
  int durationMs,
  int totalPages,
) async {
  Timer.periodic(Duration(milliseconds: durationMs), (timer) {
    if (onNextPageRequired != null) {
      onNextPageRequired();
    }
  });
}
