import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartix/networking/provider/api.dart';
import 'package:smartix/screens/login_page/domain/i_sign_in_repo.dart';

class SignInApiRepository extends ISignInRepo {
  final ApiClient apiClient;

  SignInApiRepository({required this.apiClient});

  @override
  Future<Either<String, User>> signInWithEmail(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return right(userCredential.user!);
      }
      return left("Something went wrong");
    } catch (e) {
      return left(e.toString());
    }
  }
}
