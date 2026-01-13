import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:insta/core/theme/dark_theme.dart';
import 'package:insta/core/theme/light_theme.dart';
import 'package:insta/core/util/get_di.dart';
import 'package:insta/feature/auth/screen/login_in_screen.dart';
import 'package:insta/feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final language = await init();
  runApp(MyApp(language: language));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> language;
  const MyApp({super.key, required this.language});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      // home: TestScreen(),
    );
  }
}





// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: 1,
//         child: NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//   pinned: false,

//   // 🔹 APP BAR COLOR
//   backgroundColor: Colors.blue,

//   title: const Text("Md Romjan Ali"),
//   actions: [
//     IconButton(
//       icon: const Icon(Icons.menu),
//       onPressed: () {},
//     )
//   ],

//   // expandedHeight: 260,
//   // 🔹 MIDDLE SECTION
//   // flexibleSpace: FlexibleSpaceBar(
//   //   collapseMode: CollapseMode.pin,
//   //   background: Container(
//   //     margin: const EdgeInsets.only(top: kToolbarHeight),
//   //     color: Colors.orange, // 🔥 middle widget color
//   //     child: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: const [
//   //         Text(
//   //           "Middle Widget 1",
//   //           style: TextStyle(fontSize: 22, color: Colors.white),
//   //         ),
//   //         SizedBox(height: 8),
//   //         Text(
//   //           "Middle Widget 2",
//   //           style: TextStyle(color: Colors.white),
//   //         ),
//   //       ],
//   //     ),
//   //   ),
//   // ),

// )
// ,
//               SliverAppBar(
//                 pinned: false, // 🔑 keeps appbar + tabbar visible
//                 // expandedHeight: 260,
//                 title: const Text("Md Romjan Ali"),
//                 actions: [
//                   IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
//                 ],

//                 // 🔽 MIDDLE PART
//                 // flexibleSpace: FlexibleSpaceBar(
//                 //   collapseMode: CollapseMode.pin,
//                 //   background: Padding(
//                 //     padding: const EdgeInsets.only(top: 80),
//                 //     child: Column(
//                 //       mainAxisAlignment: MainAxisAlignment.center,
//                 //       children: const [
//                 //         Text("Middle Widget 1", style: TextStyle(fontSize: 22)),
//                 //         SizedBox(height: 8),
//                 //         Text("Middle Widget 2"),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),      

//   // 🔹 TAB BAR (inherits AppBar color)
//   bottom: const TabBar(
//     tabs: [
//       Tab(icon: Icon(Icons.abc)),
//     ],
//   ),
//                         ),
//             ];
//           },

//           // 🔽 BODY
//           body: const TabBarView(
//             children: [SizedBox(
              
//               height: 1210, child: Center(child: Text("Tab Content")))],
//           ),
//         ),
//       ),
//     );
//   }
// }
