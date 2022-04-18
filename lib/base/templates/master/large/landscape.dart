import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/contracts/controller.dart';

class MasterTemplateLargeLandscape<T extends CoreController> extends GetView<T> {
  final GetView view;
  const MasterTemplateLargeLandscape({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          color: Colors.greenAccent,
        ),
        Expanded(
          child: view,
        ),
      ],
    );
  }
}
