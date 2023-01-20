import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:naslet_mobile/services/APIService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/l10n.dart';

class AuthService {
  String _token = '';
  late final SharedPreferences prefs;

  get token => _token;

  AuthService() {
    _init();
  }

  _init() async {
    prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token') ?? '';
  }

  Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    dynamic data = await APIService.postRequest(
        request: 'user/login', data: {'identity': email, 'password': password});

    try {
      if (data != '' && data['access_token'] != '') {
        await prefs.setString('token', data['access_token']);
        return 'Token: ${data['access_token']}';
      }
    } catch (e) {
      return S.current.userNotExistError;
    }

    return S.current.userNotExistError;
  }

  Future<String> regUser(
      {required String email, required String password}) async {
    dynamic data = await APIService.postRequest(
        request: 'user/register', data: {'email': email, 'password': password});

    try {
      if (data != '' && data['access_token'] != '') {
        await prefs.setString('token', data['access_token']);
        return 'Token: ${data['access_token']}';
      }
    } catch (e) {
      return S.current.userExistError;
    }

    return S.current.userExistError;
  }

  Future<String> authUser(
      {required String email, required String password}) async {
    dynamic data = await APIService.postRequest(
        request: 'user/auth', data: {'email': email, 'password': password});

    try {
      if (data != '' && data['access_token'] != '') {
        await prefs.setString('token', data['access_token']);
        return 'Token: ${data['access_token']}';
      }
    } catch (e) {
      return S.current.userExistError;
    }

    return S.current.userExistError;
  }

  Future<String> authGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        return S.current.unexpectedError;
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          return S.current.tryAgainError;
        } catch (e) {
          return S.current.unexpectedError;
        }
      }
    }

    if (user != null && user.email != null) {
      return authUser(email: user.email!, password: user.uid);
    }

    return S.current.unexpectedError;
  }

  Future<String> authVK() async {
    final vk = VKLogin();
    await vk.initSdk();

    final res = await vk.logIn(scope: [
      VKScope.email,
    ]);

    if (res.isValue) {
      final VKLoginResult result = res.asValue!.value;

      if (!result.isCanceled) {
        final VKAccessToken? accessToken = result.accessToken;
        if (accessToken != null) {
          final profileRes = await vk.getUserProfile();
          final profile = profileRes.asValue?.value;
          final String? email = await vk.getUserEmail();
          if (profile != null && email != null) {
            return authUser(email: email, password: profile.userId.toString());
          } else {
            return S.current.needEmailError;
          }
        } else {
          return S.current.unexpectedError;
        }
      } else {
        return S.current.needAccessError;
      }
    } else {
      return S.current.unexpectedError;
    }
  }

  Future<bool> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
