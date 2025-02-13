import 'package:c_valentine_app/constants/utilities.dart';
import 'package:c_valentine_app/views/components/photo_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.chevron_left,
            color: Utilities.textColor,
          ),
        ),
        title: Text(
          'Our Pictures 👩🏽‍❤️‍💋‍👨🏾',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 54.w),
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('photo_collection').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Utilities.textColor),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No photos yet 😢"));
              }

              // Get Firestore documents
              List<DocumentSnapshot> docs = snapshot.data!.docs;

              return Stack(
                children: docs.asMap().entries.map((entry) {
                  final int index =
                      docs.length - 1 - entry.key; // ✅ Reverse order
                  final doc = docs[index]; // ✅ Get reversed index

                  final String imageUrl = doc['image-url'];
                  final String date = doc['date'];
                  final String? description = doc.data() != null &&
                          (doc.data() as Map<String, dynamic>)
                              .containsKey('description')
                      ? doc['description']
                      : null;

                  return PhotoCard(
                    image: imageUrl,
                    date: date,
                    description: description,
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
