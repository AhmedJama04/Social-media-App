/*

  Auth cubit State Management
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/auth/domain/entities/app_user.dart';
import 'package:untitled/features/auth/domain/repos/auth_repo.dart';
import 'package:untitled/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepo authRepo;
  AppUser? _currentUser;
  AuthCubit({required this.authRepo}) : super (AuthInitial());

  // check if user is already authenticated
  void checkAuth () async {
    final AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(unauthenticated());
    }
  }

  // get current user
  AppUser? get currentUser => _currentUser;

  //login with email + pw
  Future<void> login (String email, String pw) async {
    try {

      emit(AuthLoading());
      final user = await authRepo.loginWithEmailAndPassword(email, pw);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(unauthenticated());
    }
  }

  // register with email + pw
  Future<void> register(String name, String email, String pw) async {
    try {

      emit(AuthLoading());
      final user = await authRepo.registerWithEmailAndPassword(name, email, pw);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(unauthenticated());
    }
  }

  // logout
  Future<void> logout() async{
    authRepo.logout();
    emit(unauthenticated());
  }
}