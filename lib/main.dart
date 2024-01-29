import 'package:flutter/material.dart';
import 'package:sharedprefpoc/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark/Light Theme Demo'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.lightbulb),
          //   onPressed: () {
          //     Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          //   },
          // ),

          Switch(
            value: Provider.of<ThemeProvider>(context).themeData.brightness ==
                Brightness.dark,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is the home screen.'),
            SizedBox(
              height: 20,
            ),
            Text("Data1"),
            SizedBox(
              height: 20,
            ),
            Text("Data2"),
            SizedBox(
              height: 20,
            ),
            Text("Data3"),
            SizedBox(
              height: 20,
            ),
            Text("Data4"),
          ],
        ),
      ),
    );
  }
}
