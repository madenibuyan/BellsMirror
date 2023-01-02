
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bells_mirror/utils/constant_string.dart';

abstract class AuthService {
  Future<dynamic> login({String email, String password});

  Future<dynamic> register({String email, String password});

  Future<dynamic> sendEmailVerification();

  Future<bool> isVendorOrAssistant();

  Future<bool> isAdmin();

  bool isEmailVerified();

  Future signOut();

  // used to demo authStateChange
  Stream<bool> changeUser();

  bool isLoggedIn();

  bool isAssistant();

  Future<dynamic> passwordReset({String email});

  String currentUserId();
}

class AuthServiceFake implements AuthService {
  @override
  Future login({String email, String password}) async {
    await Future.delayed(Duration(seconds: 3));

    return AuthResultStatus.successful;
  }

  @override
  Future passwordReset({String email}) async {
    await Future.delayed(Duration(seconds: 3));

    return Constant.loginSuccess;
  }

  @override
  Future register({String email, String password}) async {
    await Future.delayed(Duration(seconds: 4));
    return Constant.loginSuccess;
  }

  @override
  User getCurrentUser() {}

  @override
  Stream<User> authStateChange() {}

  @override
  bool isEmailVerified() {
    return true;
  }

  @override
  Future sendEmailVerification() async {}

  @override
  Future signOut() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Stream<bool> changeUser() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 5));

      if (i % 2 == 0) {
        yield true;
      } else {
        yield true;
      }
    }
  }

  @override
  bool isLoggedIn() {
    return false;
  }

  @override
  bool isAssistant() {
    return false;
  }

  @override
  Future<bool> isVendorOrAssistant() async {
    await Future.delayed(Duration(seconds: 2));

    return true;
  }

  @override
  Future<bool> isAdmin() async {
    await Future.delayed(Duration(seconds: 2));

    return true;
  }

  @override
  String currentUserId() {
    return "";
  }
}

class AuthServiceReal implements AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future login({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      return AuthResultStatus.successful;
    } catch (e) {
      if (e is FirebaseAuthException) {
        return AuthServiceExceptionHandler.generateExceptionMessage(
            AuthServiceExceptionHandler.handleException(e));
      }

      return "Login failed";
    }
  }

  @override
  Future passwordReset({String email}) async {
    List<String> providers = await auth.fetchSignInMethodsForEmail(email);

    if (providers.isEmpty) return "No user found";

    await auth.sendPasswordResetEmail(email: email);
    return AuthResultStatus.successful;
  }

  @override
  Future register({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthResultStatus.successful;
    } catch (e) {
      if (e is FirebaseAuthException) {
        return AuthServiceExceptionHandler.generateExceptionMessage(
            AuthServiceExceptionHandler.handleException(e));
      }

      return "Login failed";
    }
  }

  @override
  bool isEmailVerified() {
    if (auth.currentUser == null) return false;

    return auth.currentUser.emailVerified;
  }

  @override
  Future sendEmailVerification() async {
    await auth.currentUser.sendEmailVerification();
    await auth.signOut();
  }

  @override
  Future signOut() async {
    await auth.signOut();
  }

  @override
  Stream<bool> changeUser() async* {


    yield* auth.authStateChanges().map((event) => event != null);
  }

  @override
  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  @override
  bool isAssistant() {
    List<String> list = auth.currentUser.uid.split(".");

    if (list == null || list.isEmpty || list.length == 1) return false;

    return true;
  }

  @override
  Future<bool> isVendorOrAssistant() async {
    var tokenResult = await auth.currentUser.getIdTokenResult();

    var vendor = tokenResult.claims['vendor'];

    bool assistant = tokenResult.claims['assistant'];

    if (vendor == null && assistant == null) return false;


    if(assistant == null){
      if(vendor) return true;

      return false;
    }

    if(assistant) return true;

    return false;

  }


  @override
  Future<bool> isAdmin() async {
    var tokenResult = await auth.currentUser.getIdTokenResult();

    var admin = tokenResult.claims['admin'];


    if (admin == null) return false;

    return admin;

  }

  @override
  String currentUserId() {

    List<String> list = auth.currentUser.uid.split(".");

    return list[0];
  }
}

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

class AuthServiceExceptionHandler {
  static AuthResultStatus handleException(e) {
    var status;

    print("error is ${e.code.toUpperCase()}");
    switch (e.code.toUpperCase()) {
      case "INVALID-EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "WRONG-PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "USER-NOT-FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "USER-DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "TOO-MANY-REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "OPERATION-NOT-ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "EMAIL-ALREADY-IN-USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static generateExceptionMessage(AuthResultStatus exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "The email has already been registered.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}
