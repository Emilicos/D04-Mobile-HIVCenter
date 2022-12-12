import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/widgets/drawer.dart';

Map<String, dynamic> userData = {"is_login": false, "username": "", "role": 0};

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
        backgroundColor: Colors.pink,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                "/register",
              );
            },
            child:
            const Text(
              'Belum Memiliki Akun HIV Center?',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
        backgroundColor: AppTheme.darkBeige,
        body: 
        Container(
          decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/asset1.png'),
                  scale: 8,
                  alignment: Alignment.bottomCenter,
                  
                ),
                
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: 
                const Text(
                  "HIV Center",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                  key: _loginFormKey,
                  child: Column(
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
                                        MaterialStateProperty.all(AppTheme.tagRed),
                                  ),
                                  onPressed: () async {
                                    if (_loginFormKey.currentState!.validate()) {
                                      await request.login(
                                          "https://pbp-d04.up.railway.app/authentication/login/validate_login/",
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
                                                        userData["is_login"] =
                                                            value["is_login"];
                                                        userData["username"] =
                                                            value["username"];
                                                        userData["role"] =
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
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
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
                  )),
            ],
          ),
        ));
    // The rest of your widgets are down below
  }
}
