// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: Firestore.instance.collection("food").snapshots(),
//           builder: (ctx, streamSnapshots) {
//             if (streamSnapshots.connectionState == ConnectionState.waiting) {
//               return Container(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             final document = streamSnapshots.data.documents;
//             return ListView.builder(
//               itemCount: streamSnapshots.data.documents.length,
//               itemBuilder: (ctx, index) => Center(
//                 child: Container(
//                   child: Text(document[index]['foodName']),
//                 ),
//               ),
//             );
//           }),
//       // floatingActionButton: FloatingActionButton(
//       //     child: Icon(Icons.ac_unit),
//       //     onPressed: () {
//       //  .listen((event) {
//       //     event.documents.forEach((element) {
//       //       print(element["foodName"]);
//       //     });
//       //   });
//       //     }),
//     );
//   }
// }
