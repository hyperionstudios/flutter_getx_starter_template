import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetResponsiveView {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget? tablet() {
    return phone();
  }

  @override
  Widget? phone() {
    return Scaffold();
  }

  @override
  Widget? desktop() {
    return phone();
  }
}
