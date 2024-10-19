// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_learning_app/models/user_model.dart';
// import 'package:e_learning_app/modules/register/cubit/states.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class RegisterCubit extends Cubit<RegisterStates> {
//
//   RegisterCubit() : super(RegisterInitialState());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//   void userRegister({
//     required String name,
//     required String email,
//     required String password,
//     required String phone,
//   })
// {
//   emit(RegisterLoadingState());
//   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password,).then((value){
//     print(value.user?.email);
//     print(value.user?.uid);
//
//     userCreate(
//       uId: value.user!.uid,
//       phone: phone,
//       email: email,
//       name: name,
//
//     );
//
//     //emit(RegisterSuccessState());
//
//   }).catchError((error){
//     emit(RegisterErrorState(error.toString()));
//
//   });
// }
//
//
//
//   void userCreate({
//     required String name,
//     required String email,
//     required String phone,
//     required String uId,
//
//   }){
//
//     UserModel model = UserModel(email: email, name: name, phone: phone, uId: uId,isEmailVer: false);
// FirebaseFirestore.instance
//     .collection('users')
//     .doc(uId)
//     .set(model.toMap()).then((value){
//       emit(CreateUserSuccessState());
// }).catchError((error){
//   emit(CreateUserErrorState(error.toString()));
// });
//   }
//
//   IconData suffix = Icons.visibility_outlined;
//   bool isPassword = true;
//
//   void changePasswordVisibility() {
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//
//     emit(RegisterChangePassVisState());
//   }
// }
