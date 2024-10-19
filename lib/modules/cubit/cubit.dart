// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_learning_app/models/user_model.dart';
// import 'package:e_learning_app/modules/cubit/states.dart';
// import 'package:e_learning_app/shared/components/constants.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SocialCubit extends Cubit<SocialStates>
// {
//   SocialCubit() : super(SocialInitialState());
//   //CounterCubit cubit = BlocProvider.of(context);
//   static SocialCubit get(context) => BlocProvider.of(context);
//
//   UserModel? model;
//
//
//   void getUserData(String? uId) {
//     emit(SocialLoadingState());
//     if (uId != null && uId.isNotEmpty) {
//       FirebaseFirestore.instance.collection('users').doc(uId).get().then((
//           value) {
//         //print(value.data());
//         model = UserModel.fromJson(value.data()!);
//         emit(SocialGetUserSuccessState());
//
//       }).catchError((error) {
//         print(error.toString());
//         emit(SocialGetUserErrorState(error.toString()));
//       });
//     }
//     else {
//       // التعامل مع حالة عدم وجود uId
//       print('User ID is null or empty');
//       emit(SocialGetUserErrorState('User ID is null or empty'));
//     }
//
//   }
//   }