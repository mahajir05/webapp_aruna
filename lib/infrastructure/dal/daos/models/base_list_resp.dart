class BaseListResp<T> {
  // List<T> data = [];

  // BaseListResp({required this.data});

  // BaseListResp.fromJson(Map<String, dynamic> json) {
  //   if (json['contacts'] != null) {
  //     json['contacts'].forEach((v) {
  //       data.add(ContactModel.fromJson(v));
  //     });
  //   }
  // }

  // final int? statusCode;
  // final String? statusMessage;
  final List<T>? data;

  BaseListResp({
    // this.statusCode,
    // this.statusMessage,
    this.data,
  });

  BaseListResp.fromJson(dynamic data, Function fromJsonModel)
      : data = data != null
            ? List<T>.from(data.cast<Map<String, dynamic>>().map((itemsJson) => fromJsonModel(itemsJson)))
            : null;
}
