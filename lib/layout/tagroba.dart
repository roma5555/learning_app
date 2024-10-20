// import 'package:e_learning_app/layout/videoPlayerScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:video_player/video_player.dart';
//
// class Tagroba extends StatefulWidget {
//   @override
//   _TagrobaState createState() => _TagrobaState();
// }
//
// class _TagrobaState extends State<Tagroba> {
//   // متغيرات لجلب البيانات من Firestore و Firebase Storage
//   final CollectionReference coursesCollection =
//    FirebaseFirestore.instance.collection('courses');
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//
//   // دالة لجلب الدورات التدريبية من Firestore
//   Future<List<Map<String, dynamic>>> getCourses() async {
//     QuerySnapshot snapshot = await coursesCollection.get();
//     return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//   }
//
//   // دالة لجلب رابط الفيديو من Firebase Storage
//   Future<String> getVideoUrl(String filePath) async {
//     String downloadUrl = await storage.ref(filePath).getDownloadURL();
//     return downloadUrl;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Courses")),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: getCourses(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No courses found"));
//           }
//
//           List<Map<String, dynamic>> courses = snapshot.data!;
//           return ListView.builder(
//             itemCount: courses.length,
//             itemBuilder: (context, index) {
//               var course = courses[index];
//               return ListTile(
//                 title: Text(course['_title']),
//                 subtitle: Text(course['_description']),
//                 onTap: () async {
//                   // جلب رابط الفيديو عند الضغط على الدورة
//                   String videoUrl = await getVideoUrl(
//                     course['_sections'][0]['_lectures'][0]['_videoUrl'],
//                   );
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
