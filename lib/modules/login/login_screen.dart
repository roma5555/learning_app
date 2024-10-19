// //import 'dart:js_interop';
// import 'package:conditional_builder_rec/conditional_builder_rec.dart';
// import 'package:e_learning_app/layout/layout_screen.dart';
// import 'package:e_learning_app/models/user_model.dart';
// import 'package:e_learning_app/modules/login/cubit/cubit.dart';
// import 'package:bloc/bloc.dart';
// import 'package:e_learning_app/modules/login/cubit/states.dart';
// import 'package:e_learning_app/modules/register/register_screen.dart';
// import 'package:e_learning_app/shared/components/components.dart';
// import 'package:e_learning_app/shared/preferences/shared_preferences.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// enum ToastState { SUCCESS, ERROR, WARNING }
//
// // دالة showToast لعرض رسالة توست
// void showToast({required String text, required ToastState state}) {
//   Fluttertoast.showToast(
//     msg: text,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: chooseToastColor(state),
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }
//
//
// // دالة لاختيار لون التوست بناءً على الحالة
// Color chooseToastColor(ToastState state) {
//   switch (state) {
//     case ToastState.SUCCESS:
//       return Colors.green;
//     case ToastState.ERROR:
//       return Colors.red;
//     case ToastState.WARNING:
//       return Colors.amber;
//   }
// }
//
//
// class LoginScreen extends StatelessWidget {
//   var formkey= GlobalKey<FormState>();
//   var first= TextEditingController();
//   var pass= TextEditingController();
//
//
//    LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => LoginCubit(),
//     child: BlocConsumer<LoginCubit, LoginStates>(
//     listener: (context,state){
//       if(state is LoginErrorState){
//         showToast(text: state.error, state: ToastState.ERROR);
//       }
//
//       if(state is LoginSuccessState){
//         CacheHelper.saveData(
//           key: 'uId',
//           value: state.uId,
//         ).then((value)
//         {
//           navigateTo(context, LayoutScreen());
//         }
//
//         );
//       }
//     },
//
//     builder: (context,state){
//
//     return Scaffold(
//     appBar: AppBar(),
//     body: Center(
//     child: SingleChildScrollView(
//     child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Form(
//     key: formkey,
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Column(
//       children: [
//         Text(
//           'LOGIN',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),),
//         Text(
//           'Login now to browse our hot offers',
//           style: TextStyle(
//             fontWeight: FontWeight.w100,
//             color: Colors.grey,
//           ),),
//         SizedBox(
//           height: 30.0,
//         ),
//         TextFormField(
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter your email address';
//             }
//             return null;
//           },
//           controller: first,
//           //type:TextInputType.emailAddress,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//             filled: true,
//             fillColor: Colors.grey[250],
//             border: InputBorder.none,
//             hintText: 'Email Address',
//             prefix: Icon(Icons.email_outlined),
//           ),
//         ),
//         SizedBox(
//           height: 15.0,
//         ),
//         TextFormField(
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter your password';
//             }
//             return null;
//           },
//           controller: pass,
//           //type:TextInputType.emailAddress,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//             filled: true,
//             fillColor: Colors.grey[250],
//             border: InputBorder.none,
//             hintText: 'Password',
//             prefixIcon: Icon(Icons.lock_outlined),
//             suffixIcon: IconButton(
//               icon: Icon(LoginCubit.get(context).suffix),
//               onPressed: () {
//                 LoginCubit.get(context).changePassVis();
//               },
//             ),),
//           onFieldSubmitted:(value){
//             if (formkey.currentState!.validate()) {
//               LoginCubit.get(context).userLogin(
//                 email: first.text,
//                 password: pass.text,
//               );
//             }
//           },
//           obscureText: LoginCubit.get(context).isPassword,
//
//         ),
//
//         SizedBox(
//           height: 30.0,
//         ),
//
//         // ConditionalBuilder(
//         // condition: state is! LoginLoadingState,
//         // builder: (context) =>
//         ElevatedButton(onPressed: (){
//           if(formkey.currentState!.validate()){
//             LoginCubit.get(context).userLogin(
//               email: first.text,
//               password: pass.text,
//             );
//           }
//         },
//           child: Text(
//             'login'.toUpperCase(),
//           ),
//         ),
//         //fallback: (context) => Center(child: CircularProgressIndicator()),
//       ],
//     ),
//
//
//
//
//
//       SizedBox(
//         height: 15.0,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Don\'t have an account?',),
//           ElevatedButton(
//             onPressed: () {
//               navigateTo(
//                 context,
//                 RegisterScreen(),
//               );
//             },
//             child:  Text('Register'),
//           ),
//
//
//         ],
//       ),
//
//
//
//
//
//
// ],
//     ),
//
//     ),
//     )),
//     ),
//     );
//     },
//     ),
//     );
//
//
//   }
// }
