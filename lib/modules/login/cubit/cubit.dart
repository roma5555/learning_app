// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
// import 'states.dart';
// class LoginCubit extends Cubit<LoginStates>
// {
//   LoginCubit() : super(LoginInitialState());
//   //CounterCubit cubit = BlocProvider.of(context);
//   static LoginCubit get(context) => BlocProvider.of(context);
//   void userLogin({
// required String email,
// required String password,
//
//   })
// {
//   emit(LoginLoadingState());
//   FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,).then((value){
//     print(value.user?.email);
//     print(value.user?.uid);
//
//     emit(LoginSuccessState((value.user!.uid) ));
//
//   }).catchError((error){
//     emit(LoginErrorState(error.toString()));
//
//   });
//
//   }
//   IconData suffix= Icons.visibility_outlined;
//   bool isPassword = true;
//   void changePassVis(){
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(LoginChangePassVisState());
//   }
// }