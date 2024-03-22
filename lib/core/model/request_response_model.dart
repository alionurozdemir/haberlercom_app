class RequestResponseModel<T> {
  final RequestResponseEnum status;
  T? data;
  String? error;

  RequestResponseModel(this.status, {this.data, this.error});
}

enum RequestResponseEnum { success, error, empty, info, unknown }
