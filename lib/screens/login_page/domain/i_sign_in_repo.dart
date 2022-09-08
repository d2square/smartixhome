import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class ISignInRepo {
  Future<Either<String, User>> signInWithEmail(String email,String password);
}