// ///Widget Card1(collectionName,data1){
//   int index=0;
//   DocumentSnapshot documentSnapshot = data1!.docs[index];
//   return Card(
//
//     elevation: 5,
//     child: Container(
//       child: Column(
//         children: [
//           Container(
//             height:200,
//             width: 200,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),
//               image: DecorationImage(
//                 image:NetworkImage
//                   (documentSnapshot['images'][0],
//                 ) ,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 children: [Text(documentSnapshot['name'],style: ItemNameStyle,),
//                   Text(
//                       "\I\N\R ${documentSnapshot['price']}",
//                       style:ItemPriceStyle
//                   ),],
//               ),
//
//               GestureDetector(
//                 child: CircleAvatar(
//                   child: Icon(Icons.delete),
//                 ),
//                 onTap: () {
//                   FirebaseFirestore.instance
//                       .collection(collectionName)
//                       .doc(FirebaseAuth.instance.currentUser!.email)
//                       .collection("items").doc(documentSnapshot.id).delete(); Fluttertoast.showToast(msg: "removed successfully");
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }
