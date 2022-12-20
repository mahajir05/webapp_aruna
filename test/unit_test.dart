import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:webapp_aruna/domain/core/usecases/usecase.dart';
import 'package:webapp_aruna/domain/entities/content_entity.dart';
import 'package:webapp_aruna/domain/repositories/posts_repo_interface.dart';
import 'package:webapp_aruna/domain/usecases/posts/get_content_by_id_uc.dart';
import 'package:webapp_aruna/domain/usecases/posts/get_content_uc.dart';
import 'package:webapp_aruna/infrastructure/dal/daos/data_sources/remote_data_source.dart';
import 'package:webapp_aruna/infrastructure/dal/daos/models/base_list_resp.dart';
import 'package:webapp_aruna/infrastructure/dal/daos/models/content_model.dart';
import 'package:webapp_aruna/infrastructure/dal/daos/repositories/posts_repo.dart';

void main() {
  IRemoteDataSource? remoteDataSource;
  IPostsRepo? repo;

  setUpAll(() {
    remoteDataSource = Get.put<IRemoteDataSource>(RemoteDataSource());
    repo = Get.put<IPostsRepo>(PostsRepo(remoteDataSource: remoteDataSource ?? Get.find()));
  });

  group('remote data source', () {
    test('get content', () async {
      var data = await remoteDataSource?.getContent();
      expect(data, isA<BaseListResp<ContentModel>>());
    });
  });

  group('Repositories', () {
    test('get content', () async {
      var data = await repo?.getAllContent();
      expect(data, isA<List<ContentEntity>>());
    });

    test('get content by id', () async {
      var data = await repo?.getContentById(1);
      expect(data, isA<ContentEntity?>());
    });
  });

  group('usecases', () {
    GetContentsUc? getContentUc;
    GetContentByIdUc? getContentByIdUc;
    setUp(() {
      getContentUc = Get.put<GetContentsUc>(GetContentsUc(repo: repo ?? Get.find()));
      getContentByIdUc = Get.put<GetContentByIdUc>(GetContentByIdUc(repo: repo ?? Get.find()));
    });
    test('get content', () async {
      var data = await getContentUc!(NoParams());
      expect(data, isA<List<ContentEntity>>());
    });
    test('get content by id', () async {
      var data = await getContentByIdUc!(1);
      expect(data, isA<ContentEntity?>());
    });
  });
}
