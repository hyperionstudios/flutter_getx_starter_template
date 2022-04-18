import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

abstract class CorePlugin {
  late String? logo;
  late String? homeUrl;
  late String? repoUrl;
  late String? docsUrl;
  bool checking = false;
  late bool? available;

  /// config file name
  /// nestjs.json , laravel.json , flutter.json
  String get configFileName;

  String get configFilePath => 'assets/plugins/$configFileName.json';

  /// 6.12.0
  String get minimumVersion;

  /// -v -V --version --Version
  String get versionTag;

  /// docker , node , flutter , nest , php artisan
  String get commandName;

  /// we need to extract the version and compare by numbers
  /// specially if the user have a newer version of the plugin
  Future<bool> healthCheck() async {
    return await Process.run(commandName, [versionTag]).then((ProcessResult value) {
      if (value.stderr.isNotEmpty) {
        throw Exception(value.stderr);
      }
      if (value.stdout is String && value.stdout.isNotEmpty) {
        if (!value.stdout.contains(minimumVersion)) {
          throw Exception('${value.stdout} is not supported');
        }
      }
      return true;
    });
  }

  Future<CorePlugin> load() async {
    try {
      String data = await rootBundle.loadString('assets/plugins/$configFileName.json');
      Map<String, dynamic> json = jsonDecode(data);
      logo = json['info']['logo'];
      docsUrl = json['info']['docs'];
      homeUrl = json['info']['home'];
      repoUrl = json['info']['repo'];
    } catch (e) {
      throw Exception(e);
    }
    return this;
  }
}
