enum Status { initial, loading, success, error }

class AppResponse<T> {
  Status? status;
  T? data;
  String? message;

  AppResponse(this.status, this.data, this.message);

  AppResponse.initial() : status = Status.initial;

  AppResponse.loading() : status = Status.loading;

  AppResponse.success(this.data) : status = Status.success;

  AppResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data";
  }
}
