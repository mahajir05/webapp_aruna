import 'package:flutter/foundation.dart';

import '../../../../domain/core/errors/exceptions/service_exception.dart';
import '../../../../domain/entities/content_entity.dart';
import '../../../../domain/repositories/posts_repo_interface.dart';
import '../data_sources/remote_data_source.dart';
import '../models/base_list_resp.dart';

class PostsRepo implements IPostsRepo {
  final IRemoteDataSource remoteDataSource;

  PostsRepo({required this.remoteDataSource});

  @override
  Future<List<ContentEntity>?> getAllContent() async {
    try {
      BaseListResp<ContentEntity> res = await remoteDataSource.getContent();
      return res.data;
    } on RequestCancelledException {
      debugPrint("[$this][getContent] RequestCancelledException: request cancelled");
      return null;
    } on SessionException {
      debugPrint("[$this][getContent] SessionException: please relogin");
      return null;
    } on ClientException catch (e) {
      debugPrint("[$this][getContent] ClientException: $e");
      return null;
    } on ServerException catch (e) {
      debugPrint("[$this][getContent] ServerException: $e");
      return null;
    } on UnknownException {
      debugPrint("[$this][getContent] UnknownException");
      return null;
    } catch (e) {
      debugPrint("[$this][getContent] catch: $e");
      return null;
    }
  }

  @override
  Future<ContentEntity?> getContentById(int id) async {
    try {
      BaseListResp<ContentEntity> res = await remoteDataSource.getContent();
      var result = res.data?.firstWhere((element) => element.id == id);
      return result;
    } on RequestCancelledException {
      debugPrint("[$this][getContent] RequestCancelledException: request cancelled");
      return null;
    } on SessionException {
      debugPrint("[$this][getContent] SessionException: please relogin");
      return null;
    } on ClientException catch (e) {
      debugPrint("[$this][getContent] ClientException: $e");
      return null;
    } on ServerException catch (e) {
      debugPrint("[$this][getContent] ServerException: $e");
      return null;
    } on UnknownException {
      debugPrint("[$this][getContent] UnknownException");
      return null;
    } catch (e) {
      debugPrint("[$this][getContent] catch: $e");
      return null;
    }
  }
}
