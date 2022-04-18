class Api {
  Map<String, dynamic> information;
  Map<String, dynamic> apiBase;
  Map<String, dynamic> apiAuth;
  Map<String, dynamic> apiModels;

  String apiPrefix = '/api';
  late String base;

  Api({
    required this.information,
    required this.apiBase,
    required this.apiAuth,
    required this.apiModels,
  }) {
    if (information['status'] == 'staging') base = apiBase['staging'];
    if (information['status'] == 'local') base = apiBase['local'];
    if (information['status'] == 'production') base = apiBase['production'];
  }

  String resolve(Type model) {
    return base + apiPrefix + apiModels[model.toString()];
  }

  String buildImageUrl(String image) {
    return base + '/' + image;
  }
}
