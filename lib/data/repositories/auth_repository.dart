import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_icerock/domain/models/repository_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utils/error_handler.dart';

final authRepositoryProvider =
    StateNotifierProvider<AuthRepository, String>((ref) => AuthRepository());

final userDataAuthProvider = FutureProvider((ref) {
  final auth = ref.watch(authRepositoryProvider.notifier);
  return auth.getCurrentUserToken();
});

class AuthRepository extends StateNotifier<String> {
  AuthRepository() : super('');
  final Uri _uri = Uri.parse('https://api.github.com/user');

  Future<bool> isTokenValid(String token) async {
    try {
      var tokenRes = await http.post(
        Uri.parse('$_uri'),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(Duration(seconds: 5));
      bool isOk = httpErrorHandle(
        response: tokenRes,
      );
      if (isOk) {
        state = token;
        setToken(token);
        return true;
      }
      return false;
    } on TimeoutException catch (_) {
      throw Exception('internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getCurrentUserToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('Bearer');
      if (token == null) {
        prefs.setString('Bearer', '');
        return null;
      }
      bool isOk = await isTokenValid(token);
      if (isOk) {
        state = token;
        return token;
      }
      return null;
    } on TimeoutException catch (_) {
      throw Exception('internet');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Bearer', token);
  }

  Future<bool> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.remove('Bearer');
    return res;
  }
}
