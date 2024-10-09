// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               expandedHeight: 200.0,
//               floating: true,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: const Text(
//                   "WINGERsoft",
//                   style: TextStyle(color: Color.fromARGB(255, 54, 187, 244)),
//                 ),
//                 background: Image.network(
//                   'https://cdn.pixabay.com/photo/2018/07/25/16/00/art-3561710_1280.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text('Item #$index'),
//                   );
//                 },
//                 childCount: 20,
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 height: 100,
//                 color: Colors.green,
//                 child: const Center(child: Text('SliverToBoxAdapter')),
//               ),
//             ),
//             SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10.0,
//                 crossAxisSpacing: 10.0,
//                 childAspectRatio: 4.0,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return Container(
//                     color: Colors.blue,
//                     child: Center(child: Text('Grid Item #$index')),
//                   );
//                 },
//                 childCount: 8,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
