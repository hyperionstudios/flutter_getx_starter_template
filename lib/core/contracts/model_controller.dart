import 'package:get/get.dart';

import 'controller.dart';
import 'model.dart';

abstract class ModelController<T extends CoreModel> extends CoreController {
  RxList<T> modelList = RxList<T>();
  Rxn<T> selectedModel = Rxn<T>();

  getModels();

  getModel(String id);
}
