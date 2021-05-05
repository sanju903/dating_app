// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$appuserAtom = Atom(name: 'LoginStoreBase.appuser');

  @override
  AppUser get appuser {
    _$appuserAtom.reportRead();
    return super.appuser;
  }

  @override
  set appuser(AppUser value) {
    _$appuserAtom.reportWrite(value, super.appuser, () {
      super.appuser = value;
    });
  }

  final _$isLoginLoadingAtom = Atom(name: 'LoginStoreBase.isLoginLoading');

  @override
  bool get isLoginLoading {
    _$isLoginLoadingAtom.reportRead();
    return super.isLoginLoading;
  }

  @override
  set isLoginLoading(bool value) {
    _$isLoginLoadingAtom.reportWrite(value, super.isLoginLoading, () {
      super.isLoginLoading = value;
    });
  }

  final _$isOtpLoadingAtom = Atom(name: 'LoginStoreBase.isOtpLoading');

  @override
  bool get isOtpLoading {
    _$isOtpLoadingAtom.reportRead();
    return super.isOtpLoading;
  }

  @override
  set isOtpLoading(bool value) {
    _$isOtpLoadingAtom.reportWrite(value, super.isOtpLoading, () {
      super.isOtpLoading = value;
    });
  }

  final _$loginScaffoldKeyAtom = Atom(name: 'LoginStoreBase.loginScaffoldKey');

  @override
  GlobalKey<ScaffoldState> get loginScaffoldKey {
    _$loginScaffoldKeyAtom.reportRead();
    return super.loginScaffoldKey;
  }

  @override
  set loginScaffoldKey(GlobalKey<ScaffoldState> value) {
    _$loginScaffoldKeyAtom.reportWrite(value, super.loginScaffoldKey, () {
      super.loginScaffoldKey = value;
    });
  }

  final _$otpScaffoldKeyAtom = Atom(name: 'LoginStoreBase.otpScaffoldKey');

  @override
  GlobalKey<ScaffoldState> get otpScaffoldKey {
    _$otpScaffoldKeyAtom.reportRead();
    return super.otpScaffoldKey;
  }

  @override
  set otpScaffoldKey(GlobalKey<ScaffoldState> value) {
    _$otpScaffoldKeyAtom.reportWrite(value, super.otpScaffoldKey, () {
      super.otpScaffoldKey = value;
    });
  }

  final _$firebaseUserAtom = Atom(name: 'LoginStoreBase.firebaseUser');

  @override
  User get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(User value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  final _$_getUserAsyncAction = AsyncAction('LoginStoreBase._getUser');

  @override
  Future<AppUser> _getUser() {
    return _$_getUserAsyncAction.run(() => super._getUser());
  }

  final _$isAlreadyAuthenticatedAsyncAction =
      AsyncAction('LoginStoreBase.isAlreadyAuthenticated');

  @override
  Future<bool> isAlreadyAuthenticated() {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated());
  }

  final _$signInWithEmailPassAsyncAction =
      AsyncAction('LoginStoreBase.signInWithEmailPass');

  @override
  Future<void> signInWithEmailPass(
      BuildContext context, String email, String pass) {
    return _$signInWithEmailPassAsyncAction
        .run(() => super.signInWithEmailPass(context, email, pass));
  }

  final _$registerWithEmailPassAsyncAction =
      AsyncAction('LoginStoreBase.registerWithEmailPass');

  @override
  Future<void> registerWithEmailPass(BuildContext context) {
    return _$registerWithEmailPassAsyncAction
        .run(() => super.registerWithEmailPass(context));
  }

  final _$onAuthenticationSuccessfulAsyncAction =
      AsyncAction('LoginStoreBase.onAuthenticationSuccessful');

  @override
  Future<void> onAuthenticationSuccessful(
      BuildContext context, dynamic result) {
    return _$onAuthenticationSuccessfulAsyncAction
        .run(() => super.onAuthenticationSuccessful(context, result));
  }

  final _$signOutAsyncAction = AsyncAction('LoginStoreBase.signOut');

  @override
  Future<void> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  final _$getChatsWithUserAsyncAction =
      AsyncAction('LoginStoreBase.getChatsWithUser');

  @override
  Future<List<ChatWithUser>> getChatsWithUser(String userId) {
    return _$getChatsWithUserAsyncAction
        .run(() => super.getChatsWithUser(userId));
  }

  @override
  String toString() {
    return '''
appuser: ${appuser},
isLoginLoading: ${isLoginLoading},
isOtpLoading: ${isOtpLoading},
loginScaffoldKey: ${loginScaffoldKey},
otpScaffoldKey: ${otpScaffoldKey},
firebaseUser: ${firebaseUser}
    ''';
  }
}
