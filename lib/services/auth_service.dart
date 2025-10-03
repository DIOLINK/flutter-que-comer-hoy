import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // Stream para escuchar cambios en el estado de autenticación
  Stream<User?> get user {
    print("AuthService: user stream requested");
    return _auth.authStateChanges();
  }

  // Iniciar sesión con Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print("AuthService: Attempting Google Sign-In");
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();

      if (googleUser == null) {
        print("AuthService: Google Sign-In cancelled by user.");
        return null;
      }

      print("AuthService: Google Sign-In successful, getting auth details.");
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      print("AuthService: Signing in with credential");
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("AuthService: Error during Google Sign-In: $e");
      return null;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    print("AuthService: Signing out");
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
