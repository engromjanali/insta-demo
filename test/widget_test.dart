import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true, // 🔑 keeps appbar + tabbar visible
                expandedHeight: 260,
                title: const Text("Md Romjan Ali"),
                actions: [
                  IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                ],

                // 🔽 MIDDLE PART
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Middle Widget 1", style: TextStyle(fontSize: 22)),
                        SizedBox(height: 8),
                        Text("Middle Widget 2"),
                      ],
                    ),
                  ),
                ),

                // 🔽 TAB BAR
                bottom: const TabBar(tabs: [Tab(icon: Icon(Icons.abc)),Tab(icon: Icon(Icons.abc)),Tab(icon: Icon(Icons.abc))]),
              ),
            ];
          },

          // 🔽 BODY
          body: const TabBarView(
            children: [Center(child: Text("Tab Content"))],
          ),
        ),
      ),
    );
  }
}
