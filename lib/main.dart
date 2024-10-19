import 'package:e_learning_app/argument/checkout_argument.dart';
import 'package:e_learning_app/argument/course_argument.dart';
import 'package:e_learning_app/layout/layout_screen.dart';
import 'package:e_learning_app/modules/cubit/cubit.dart';
import 'package:e_learning_app/modules/cubit/states.dart';
import 'package:e_learning_app/modules/login/login_screen.dart';
import 'package:e_learning_app/screens/courses/my_courses_list.dart';
import 'package:e_learning_app/screens/courses/whishlist_screen.dart';
import 'package:e_learning_app/screens/details/course_details.dart';
import 'package:e_learning_app/screens/home/course_home.dart';
import 'package:e_learning_app/screens/intro/intro_screen.dart';
import 'package:e_learning_app/screens/shopping/checkout_screen.dart';
import 'package:e_learning_app/screens/shopping/shopping_cart_screen.dart';
import 'package:e_learning_app/shared/components/constants.dart';
import 'package:e_learning_app/util/route_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/preferences/shared_preferences.dart';
void main() async{
  // Ensure that bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //// await CacheHelper.init();
  //// Widget startWidget;
  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  //token = CacheHelper.getData(key: 'token');
  //uId = CacheHelper.getData(key: 'uId');

  //// var uId= await CacheHelper.getData(key: 'uId');
  ////
  //// if(uId != null){
  ////   startWidget= LayoutScreen();
  //// }
  //// else{
  ////   startWidget= LoginScreen();
  ////
  //// }



  runApp( MyApp(
    //// startWidget: startWidget,
    ////uId: uId,
  ));


}

class MyApp extends StatelessWidget {
  //// final Widget startWidget;
  //// final String? uId;
  const MyApp({super.key,
    ////required this.startWidget,
    ////this.uId
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ////return BlocProvider(create: (context) => SocialCubit()..getUserData(uId),
    ////child:
    //BlocConsumer<SocialCubit,SocialStates>(
      //listener: (context,state){},
      //builder: (context,state){
        //return
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //taba3na elle taht we theme
          routes: {
            RouteNames.intro: (context) => const IntroScreen(),
            RouteNames.courseHome: (context) => const CourseHome(),
            RouteNames.shoppingCart: (context) => const ShoppingCartScreen(),
            RouteNames.myCourseList:(context) => const MyCoursesList(),
            RouteNames.whishlist:(context) => const WhishlistScreen(),





          },
            onGenerateRoute: (settings){
            if(settings.name == RouteNames.courseDetails){
              final args = settings.arguments as CourseArgument;
              return MaterialPageRoute(builder: (context) => CourseDetails(course: args.course));
            }else if(settings.name==RouteNames.checkout){
                final args = settings.arguments as CheckoutArgument;
                return MaterialPageRoute(builder: (context) => CheckoutScreen(courseList: args.courseList,totalPrice: args.totalPrice,));

            }
            },



            //de mesh taba3na
         //// home: startWidget,
        );
     // },
    ////);

  }
}
