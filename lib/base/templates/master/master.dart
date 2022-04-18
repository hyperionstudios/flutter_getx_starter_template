import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/contracts/controller.dart';
import 'large/landscape.dart';
import 'medium/landscape.dart';
import 'medium/portrait.dart';
import 'small/landscape.dart';
import 'small/portrait.dart';

class MasterTemplate<T extends CoreController> extends GetResponsiveView<T> {
  final GetView view;
  MasterTemplate({Key? key, required this.view}) : super(key: key);

  @override
  Widget? desktop() {
    return Scaffold(
      body: MasterTemplateLargeLandscape<T>(
        view: view,
      ),
    );
  }

  @override
  Widget? tablet() {
    return OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        return MasterTemplateMediumPortrait<T>(
          view: view,
        );
      } else {
        return MasterTemplateMediumLandscape<T>(
          view: view,
        );
      }
    });
  }

  @override
  Widget? phone() {
    return OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        return MasterTemplateSmallPortrait<T>(
          view: view,
        );
      } else {
        return MasterTemplateSmallLandscape<T>(
          view: view,
        );
      }
    });
  }
}
