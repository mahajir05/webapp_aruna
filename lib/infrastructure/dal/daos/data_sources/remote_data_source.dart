import 'package:dio/dio.dart' as dio;

import '../../../../config.dart';
import '../../../../domain/core/errors/exceptions/service_exception.dart';
import '../../services/api_service.dart';
import '../models/base_list_resp.dart';
import '../models/content_model.dart';

abstract class IRemoteDataSource {
  Future<BaseListResp<ContentModel>> getContent();
}

class RemoteDataSource implements IRemoteDataSource {
  @override
  Future<BaseListResp<ContentModel>> getContent() async {
    final apiService = ApiService();
    var res = await apiService.baseUrl(ConfigEnvironments.getEnvironments()['url']!).get(
          apiPath: '/posts',
        );
    switch (res.statusCode) {
      case 200:
        return BaseListResp<ContentModel>.fromJson(res.data, ContentModel.fromJson);
      default:
        return handleErrors(res);
    }
  }
}

handleErrors(dio.Response response) {
  if (response.statusCode == null && response.data['code'] == null) {
    throw RequestCancelledException();
  } else {
    if (response.statusCode.toString().startsWith('4')) {
      throw ClientException("${response.data['code']}:${response.data['message']}");
    } else if (response.statusCode.toString().startsWith('5')) {
      throw ServerException(false);
    } else {
      throw UnknownException();
    }
  }
}
