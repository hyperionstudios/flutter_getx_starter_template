import 'package:flutter/material.dart';

import 'policy.dart';
import 'route.dart';

/// Main Menu --- File , Edit , View , Help
/// File - New , Open , Save , Save As , Close , Exit
abstract class CoreMenu {
  Widget? get child;
  CorePolicy? get policy;
  List<CorePolicy>? get allPolicies;
  List<CorePolicy>? get anyPolicy;
  String get name;
  List<CoreMenu>? get subMenus;
  List<CoreRoute> get routes;
}
