import 'package:e_learning_app/argument/checkout_argument.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/models/section.dart';
import 'package:e_learning_app/screens/details/widget/favourite.dart';
import 'package:e_learning_app/shared/components/constants.dart';
import 'package:e_learning_app/util/route_names.dart';
import 'package:e_learning_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:e_learning_app/data_provider/shopping_cart_data_provider.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key?key,required this.course}) : super(key:key);
  // ({super, required this.course.key});
  final Course course;
  @override
  Widget build(BuildContext context) {

    var greyTextStyle = const TextStyle(fontSize: 15,color: Colors.black);
    return Scaffold(
      body: SafeArea(child:  Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:  10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                              child: Icon(Icons.arrow_back,color: Colors.grey.shade800,)),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.share,color: Colors.grey.shade800,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Util.openShoppingCart(context);
                                },
                                  child: Icon(Icons.shopping_cart,color: Colors.grey.shade800,)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [ ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(course.thumbnailUrl)),
                    Column(
                      children: const [
                        Icon(Icons.play_arrow,size: 90,color: Colors.white,),
                        SizedBox(
                          height: 20,
                        ),
                        Text('preview this course',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                        color: Colors.white),),
                      ],
                    ),
                    ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
            
                      )
                    ),
                    child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,),
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(course.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey.shade800),
                         ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const  Icon(Icons.person,color: kBlueColor,),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(course.createdBy,style: const TextStyle(fontSize: 16,color: kBlueColor),),
                              ],
                            ),
                            Favourite(course: course)
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.play_circle_outline),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('${course.lessonNo} Lessons',style: greyTextStyle,),
                              ],
                            ),
            
                            const SizedBox(width: 20,),
            
                            Row(
                              children: [
                                const Icon(Icons.access_time),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(course.duration,style: greyTextStyle,),
                              ],
                            ),
                            const SizedBox(width: 20,),
                            Row(
                              children: [
                                const Icon(Icons.star,size: 25,color: Colors.yellow,),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('${course.rate}',style: greyTextStyle,),
                              ],
                            ),
                          ],
                        ),
            
                        const SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(course.description,
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: "show more",
                        trimExpandedText: "show less",
                        moreStyle: const TextStyle(
                          color: kBlueColor,
                          fontWeight: FontWeight.bold ,
                        ),
                          lessStyle: const TextStyle(
                            color: kBlueColor,
                            fontWeight: FontWeight.bold ,
                          ),
                        style: const TextStyle(
                          fontSize: 17,
                            color: Colors.grey,
                        ),),
                        const SizedBox(
                          height: 20,
                        ),
            
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "course content",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "('${course.sections.length} Sections')",
                            style: TextStyle(fontSize: 20,color: Colors.blueGrey),
                          ),
            
                      ],
                    ),
            
            
                    ListView.builder(
                  shrinkWrap: true,
                  itemCount: course.sections.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
              return buildCourseContent(index);
                  }),
            
                  ],
                  ),),
                  ),
                  ],),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.only(left: 5 ,right: 5,bottom:5,),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${course.price}',style: TextStyle(fontSize: 30,color: Colors.white12),),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          String message= "course is already added to cart";
                          if(!ShoppingCartDataProvider.shoppingCartCourseList.contains(course)){
                            message= "course is already added to cart";
                            ShoppingCartDataProvider.addCourse(course);
                          }
                          Util.showMessageWithAction(context,message,"view",(){
                            Util.openShoppingCart(context);

                          });

                        },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor
                          ),
                          child: const Text("Add to Cart",style: TextStyle(fontSize: 20),) ,),
                        const SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){

                          Navigator.pushNamed(context, RouteNames.checkout,
                              arguments: CheckoutArgument([course], course.price)
                          );
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor
                          ),
                          child: const Text("Buy",style: TextStyle(fontSize: 20),) ,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),),
    );
  }



  Widget buildCourseContent(int index){
    Section section = course.sections[index];
    return ExpansionTile(
        title: Text("Section ${index +1} - ${section.name}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
    ,children: section.lectures.map((lecture){
      return ListTile(
        dense: true,
        onTap: (){

        },
        leading: const SizedBox() ,
        title: Text(lecture.name),
        subtitle: Row(
          children: [
            const Icon(Icons.access_time,size: 15,),
            const SizedBox(width: 10,),
Text(lecture.duration,style: TextStyle(color: Colors.blueGrey,fontSize: 15),)
            ],
        ),
      );
    }).toList(),);
  }

}
