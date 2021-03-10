// import 'dart:js';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:zero_hunger/helper/constants.dart';
// import 'package:zero_hunger/services/database.dart';
// import 'package:zero_hunger/views/conversation_screen.dart';
// import 'package:zero_hunger/widgets/widget.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   DatabaseMethods databaseMethods = new DatabaseMethods();
//   TextEditingController searchTextEditingController =
//       new TextEditingController();
//   Constants constants = new Constants();

//   QuerySnapshot searchSnapshot;

//   bool isLoading = false;
//   bool haveUserSearched = false;

//   initiateSearch() async {
//     if (searchTextEditingController.text.isNotEmpty) {
//       setState(() {
//         isLoading = true;
//       });
//     }
//     await databaseMethods
//         .getUserByUsername(searchTextEditingController.text)
//         .then((val) {
//       setState(() {
//         searchSnapshot = val;
//         setState(() {
//           isLoading = false;
//           haveUserSearched = true;
//         });
//       });
//     });
//   }

//   Widget searchList() {
//     return searchSnapshot != null
//         ? ListView.builder(
//             itemCount: searchSnapshot.docs.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return createChatroomAndStartConversation().SearchTile(
//                 userName: searchSnapshot.docs[index].data()["name"],
//                 userEmail: searchSnapshot.docs[index].data()["email"],
//               );
//             })
//         : Container();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarMain(context),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.black38,
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: searchTextEditingController,
//                         style: TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                           hintText: "search organizations",
//                           hintStyle: TextStyle(
//                             color: Colors.black38,
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         initiateSearch();
//                       },
//                       child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                               const Color(0x36FFFFFF),
//                               const Color(0x0FFFFFF),
//                             ]),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           padding: EdgeInsets.all(12),
//                           child: Image.asset("assets/images/search_white.png")),
//                     ),
//                   ],
//                 ),
//               ),
//               createChatroomAndStartConversation()
//                   .SearchTile(searchTextEditingController.text)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///create chatroom, send user to conv screen, push replacemnt
// DatabaseMethods databaseMethods = new DatabaseMethods();

// createChatroomAndStartConversation({String userName, context}) {
//   String chatRoomId = getChatRoomId(userName, Constants.myName);
//   List<String> users = [userName, Constants.myName];

//   Map<String, dynamic> charRoomMap = {"users": users, "chatroomId": chatRoomId};

//   databaseMethods.createChatRoom(chatRoomId, charRoomMap);
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => ConversationScreen()));

//   Widget SearchTile({String userName, String userEmail}) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 userName,
//                 style: mediumTextStyle(),
//               ),
//               Text(
//                 userEmail,
//                 style: mediumTextStyle(),
//               ),
//             ],
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () {
//               createChatroomAndStartConversation(userName: userName);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               child: Text(
//                 "Message",
//                 style: mediumTextStyle(),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// getChatRoomId(String a, String b) {
//   if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
//     return "$b\_$a";
//   } else {
//     return "$a\_$b";
//   }
// }
