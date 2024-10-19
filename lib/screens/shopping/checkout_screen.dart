import 'package:csc_picker/csc_picker.dart';
import 'package:e_learning_app/data_provider/my_course_data_provider.dart';
import 'package:e_learning_app/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/screens/shopping/widget/payment_methods.dart';
import 'package:e_learning_app/shared/components/constants.dart';
import 'package:e_learning_app/util/route_names.dart';
import 'package:e_learning_app/util/util.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.courseList, required this.totalPrice});

  final List<Course> courseList;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Billing Addresse",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black26),),
              const SizedBox(
                height: 10,
              ),
              CSCPicker(
                layout: Layout.vertical,
                flagState: CountryFlag.DISABLE,
                onCountryChanged: (value){},
                onStateChanged: (value){} ,
                onCityChanged: (value){},
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Payment Method",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black26),),
              const SizedBox(
                height: 10,
              ),
              PaymentMethods(),
              const SizedBox(
                height: 10,
              ),
              Text("Order",
              style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26,
              ),),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: ListView.builder(
                itemCount: courseList.length,
                  itemBuilder: (context,index){
                Course course=courseList[index];
                return ListTile(
                  leading: Image.asset(
                    course.thumbnailUrl,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(course.title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  trailing: Text("\$${course.price}"),
                );
              }) ),
          
            ],
          
          ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$$totalPrice",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black26),),
                  ElevatedButton(onPressed: (){
                    MyCourseDataProvider.addAllCourses(courseList);
                    ShoppingCartDataProvider.clearCart();
                    Util.showMessage(context, "ur order is placed successfully");
                    Navigator.pushNamed(context, RouteNames.courseHome);
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                      child: const Text("Place Order",style: TextStyle(fontSize: 20,),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
