import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/pages/AddBlogPage.dart';
import 'package:tk_akhir/pages/BlogpostPage.dart';
import 'package:tk_akhir/pages/Homepage.dart';
import 'package:tk_akhir/pages/LoginPage.dart';
import 'package:tk_akhir/pages/RegisterPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
            title: 'Authentication',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Authentication Page'),
            routes: {
              "/login": (BuildContext context) => const LoginPage(),
              "/register": (BuildContext context) => const RegisterPage(),
              "/blogpost": (BuildContext context) => const BlogpostPage(),
              "/homepage": (BuildContext context) =>
                  const Homepage(title: "Homepage"),
              "/create-blogpost": (BuildContext context) => const AddBlogPage(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () =>
                        {Navigator.pushReplacementNamed(context, "/login")},
                    child: const Text("Login",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () =>
                        {Navigator.pushReplacementNamed(context, "/register")},
                    child: const Text("Register",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
