import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_icerock/data/repositories/auth_repository.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utils/error_handler.dart';

final githubRepositoryProvider = Provider<GithubRepository>((ref) {
  return GithubRepository(ref);
});

class GithubRepository {
  final ProviderRef ref;
  GithubRepository(this.ref);
  final Uri _uri = Uri.parse('https://api.github.com/user/repos');
  String getReadmeApi(String owner, String repo) {
    return 'https://api.github.com/repos/$owner/$repo/contents/README.md';
  }

  Future<List<RepoModel>?> getRepositoriesForUser() async {
    try {
      String token = ref.read(authRepositoryProvider);
      if (token.isEmpty) {
        String? temp = await ref.read(userDataAuthProvider.future);
        if (temp == null) {
          throw Exception('NotFoundToken');
        } else {
          token = temp;
        }
      }
      final res = await http.get(_uri, headers: {
        'Authorization': 'Bearer $token'
      }).timeout(Duration(seconds: 5));
      List<RepoModel> repos = [];

      bool isOk = httpErrorHandle(
        response: res,
      );

      if (isOk) {
        List list = jsonDecode(res.body);
        int length = list.length > 10
            ? 10
            : list.length; // for showing first 10 elements of the array
        for (var i = 0; i < length; i++) {
          RepoModel temp = RepoModel.fromMap(list[i]);
          String link =
              getReadmeApi(list[i]["owner"]["login"] as String, temp.name);
          int langColor = 0xFFFFFFFF;
          if (temp.language != 'none') {
            langColor = await getLangColor(temp.language);
          }
          RepoModel resultModel =
              temp.copyWith(mdLink: link, languageColor: langColor);
          repos.add(resultModel);
        }
        return repos;
      }
    } on TimeoutException catch (_) {
      throw Exception('internet');
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> getLangColor(String lang) async {
    final String response =
        await rootBundle.loadString('assets/json/github-lang-colors.json');
    final data = await json.decode(response);
    return int.parse(data[lang]);
  }

  Future<String?> getMarkDownFile(String link) async {
    try {
      final res = await http.get(Uri.parse(link)).timeout(Duration(seconds: 5));
      bool isOk = httpErrorHandle(
        response: res,
      );
      if (isOk) {
        final Map<String, dynamic> responseData = json.decode(res.body);
        final String content = utf8.decode(base64
            .decode(responseData['content'].replaceAll(RegExp(r'\n'), '')));
        return content;
      }
      return null;
    } on TimeoutException catch (_) {
      throw Exception('internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
