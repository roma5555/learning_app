import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';




class Courssses extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchCourses() async {
    QuerySnapshot snapshot = await _firestore.collection('courses').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<String> getDownloadURL(String gsUrl) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(gsUrl);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error getting download URL: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading courses.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No courses available.'));
          }

          List<Map<String, dynamic>> courses = snapshot.data!;

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              var course = courses[index];
              return FutureBuilder<String>(
                future: getDownloadURL(course['_thumbnailUrl']),
                builder: (context, urlSnapshot) {
                  if (urlSnapshot.connectionState == ConnectionState.waiting) {
                    return ListTile(
                      title: Text(course['_title']),
                      subtitle: Text(course['_description']),
                      leading: CircularProgressIndicator(),
                    );
                  } else if (urlSnapshot.hasError || !urlSnapshot.hasData) {
                    return ListTile(
                      title: Text(course['_title']),
                      subtitle: Text(course['_description']),
                      leading: Icon(Icons.error),
                    );
                  }

                  String thumbnailUrl = urlSnapshot.data!;
                  return ListTile(
                    title: Text(course['_title']),
                    subtitle: Text(course['_description']),
                    leading: Image.network(thumbnailUrl),
                    trailing: Text("\$${course['_price']}"),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
