import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> UserData = {"is_login": false, "username": "", "role": 0};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Form(
            key: _loginFormKey,
            child: ListView(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          labelText: "Username",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Username tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              togglePasswordView();
                            },
                            child: Icon(isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            password = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            password = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Password tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () async {
                              if (_loginFormKey.currentState!.validate()) {
                                await request.login(
                                    "http://localhost:8000/authentication/login/validate_login/",
                                    {
                                      'username': username,
                                      'password': password,
                                    }).then((value) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            Center(
                                                child: Text(value["is_login"]
                                                    ? 'Login berhasil!'
                                                    : "Kredensial yang dimasukkan salah")),
                                            const SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {
                                                if (value["is_login"]) {
                                                  UserData["is_login"] =
                                                      value["is_login"];
                                                  UserData["username"] =
                                                      value["username"];
                                                  UserData["role"] =
                                                      value["role"];
                                                  Navigator.pop(context);
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, "/homepage");
                                                } else {
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text(value["is_login"]
                                                  ? 'Homepage'
                                                  : "Kembali"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }, onError: (error) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            const Center(
                                                child: Text(
                                                    'Login gagal karena server!')),
                                            const SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text('Kembali'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                });
                                // Add sesuatu
                              }
                            },
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )));
    // The rest of your widgets are down below
  }
}
