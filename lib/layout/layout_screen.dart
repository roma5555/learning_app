// import 'package:e_learning_app/modules/cubit/cubit.dart';
// import 'package:e_learning_app/modules/cubit/states.dart';
// import 'package:e_learning_app/modules/login/login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LayoutScreen extends StatelessWidget {
//   const LayoutScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialStates>(
//         listener: (context, state) {
//     },
//     builder: (context, state) {
//       var model = SocialCubit.get(context).model;
//       if (model != null) {
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: [
//               if(!FirebaseAuth.instance.currentUser!.emailVerified)
//                  Container(
//                 height: 50.0,
//                 child: Row(
//                   children: [
//                     Expanded(child: Text('verify ur email')),
//                     SizedBox(
//                       width: 20.0,
//                     ),
//                     ElevatedButton(onPressed: (){
//                       FirebaseAuth.instance.currentUser?.sendEmailVerification().then((value){
//                         showToast(text: 'check ur mail', state: ToastState.SUCCESS);
//     }).catchError((error){});
//
//                        }, child: Text('send email ver'),),
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         );
//
//       } else {
//         return Center(child: CircularProgressIndicator());
//       }
//     },
//     );
// }}
