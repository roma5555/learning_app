// import 'package:e_learning_app/layout/layout_screen.dart';
// import 'package:e_learning_app/modules/register/cubit/cubit.dart';
// import 'package:e_learning_app/modules/register/cubit/states.dart';
// import 'package:e_learning_app/shared/components/components.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
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
// class RegisterScreen extends StatelessWidget {
//   var formkey= GlobalKey<FormState>();
//   var name= TextEditingController();
//   var firstt= TextEditingController();
//   var passs= TextEditingController();
//   var phone= TextEditingController();
//
//
//
//   RegisterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RegisterCubit(),
//       child: BlocConsumer<RegisterCubit, RegisterStates>(
//         listener: (context,state){
//           if(state is CreateUserSuccessState){
//               navigateTo(context, LayoutScreen());
//           }
//         },
//         builder: (context,state){
//
//           return Scaffold(
//             appBar: AppBar(),
//             body: Center(
//               child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Form(
//                       key: formkey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 'REGISTER',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),),
//                               Text(
//                                 'register now to browse our hot offers',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w100,
//                                   color: Colors.grey,
//                                 ),),
//                               SizedBox(
//                                 height: 30.0,
//                               ),
//
//
//                               TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your name ';
//                                   }
//                                   return null;
//                                 },
//                                 controller: name,
//                                 //type:TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   filled: true,
//                                   fillColor: Colors.grey[250],
//                                   border: InputBorder.none,
//                                   hintText: 'user name',
//                                   prefix: Icon(Icons.email_outlined),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15.0,
//                               ),
//
//
//
//
//                               TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your email address';
//                                   }
//                                   return null;
//                                 },
//                                 controller: firstt,
//                                 //type:TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   filled: true,
//                                   fillColor: Colors.grey[250],
//                                   border: InputBorder.none,
//                                   hintText: 'Email Address',
//                                   prefix: Icon(Icons.email_outlined),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15.0,
//                               ),
//                               TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your password';
//                                   }
//                                   return null;
//                                 },
//                                 controller: passs,
//                                 //type:TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   filled: true,
//                                   fillColor: Colors.grey[250],
//                                   border: InputBorder.none,
//                                   hintText: 'Password',
//                                   prefixIcon: Icon(Icons.lock_outlined),
//                                   suffixIcon: IconButton(
//                                     icon: Icon(RegisterCubit.get(context).suffix),
//                                     onPressed: () {
//                                       RegisterCubit.get(context).changePasswordVisibility();
//                                     },
//                                   ),),
//                                 onFieldSubmitted:(value){
//                                   if (formkey.currentState!.validate()) {
//                                     // RegisterCubit.get(context).userRegister(
//                                     //   email: firstt.text,
//                                     //   password: passs.text,
//                                     // );
//                                   }
//                                 },
//                                 obscureText: RegisterCubit.get(context).isPassword,
//
//                               ),
//
//                               SizedBox(
//                                 height: 30.0,
//                               ),
//
//
//                               TextFormField(
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your phone';
//                                   }
//                                   return null;
//                                 },
//                                 controller: phone,
//                                 //type:TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.green.withOpacity(0.1))),
//                                   filled: true,
//                                   fillColor: Colors.grey[250],
//                                   border: InputBorder.none,
//                                   hintText: 'phone',
//                                   prefix: Icon(Icons.email_outlined),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15.0,
//                               ),
//
//                               // ConditionalBuilder(
//                               // condition: state is! LoginLoadingState,
//                               // builder: (context) =>
//                               ElevatedButton(onPressed: (){
//                                 if(formkey.currentState!.validate()){
//                                   RegisterCubit.get(context).userRegister(
//                                     name: name.text,
//                                     email: firstt.text,
//                                     password: passs.text,
//                                     phone: phone.text,
//
//                                   );
//                                 }
//                               },
//                                 child: Text(
//                                   'register'.toUpperCase(),
//                                 ),
//                               ),
//                               //fallback: (context) => Center(child: CircularProgressIndicator()),
//                             ],
//                           ),
//
//                             ],
//                           ),
//                       ),
//
//                     ),
//                   )),
//             );
//         },
//       ),
//     );
//
//
//   }
// }
