import 'package:flutter/material.dart';

import 'policy.dart';

abstract class CoreRoute {
  String name;
  String path;
  Widget? child;
  VoidCallback onClick;

  CorePolicy? policy;
  List<CorePolicy>? allPolicies;
  List<CorePolicy>? anyPolicy;

  CoreRoute(
      {required this.name,
      required this.path,
      required this.onClick,
      this.child,
      this.policy,
      this.anyPolicy,
      this.allPolicies});

  bool enabled() {
    if (policy != null) {
      return policy!.enabled();
    }
    if (anyPolicy != null) {
      for (var p in anyPolicy!) {
        if (p.enabled()) {
          return true;
        }
      }
      return false;
    }
    if (allPolicies != null) {
      for (var p in allPolicies!) {
        if (!p.enabled()) {
          return false;
        }
      }
      return true;
    }
    return true;
  }

  bool display() {
    if (policy != null) {
      return policy!.display();
    }
    if (anyPolicy != null) {
      for (var p in anyPolicy!) {
        if (p.display()) {
          return true;
        }
      }
      return false;
    }
    if (allPolicies != null) {
      for (var p in allPolicies!) {
        if (!p.display()) {
          return false;
        }
      }
      return true;
    }
    return true;
  }

  bool see() {
    return true;
  }
}
