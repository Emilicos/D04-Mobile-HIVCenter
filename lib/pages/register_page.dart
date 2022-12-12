import 'dart:html';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, dynamic> userData = {"is_taken": false};

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String email = "";
  String fName = "";
  String lName = "";
  String pass1 = "";
  String pass2 = "";

  @override
  Widget build(BuildContext context){
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                "/login",
              );
            },
            child:
            const Text(
              'Sudah Memiliki Akun?',
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
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: 
              const Text(
                "Registrasi HIV Center",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          Form(
            key: _registerFormKey,
            child: Column(
              children: [
                Padding(
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value){
                          setState(() {
                            username = value!;
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            username = value!;
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.isEmpty){
                            return 'Username tidak boleh kosong';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value){
                          setState(() {
                            email = value!;
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            email = value!;
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.isEmpty){
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "First Name",
                          labelText: "First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value){
                          setState(() {
                            fName = value!;
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            fName = value!;
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.isEmpty){
                            return 'First Name tidak boleh kosong';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Last Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          labelText: "Last Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value){
                          setState(() {
                            lName = value!;
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            lName = value!;
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.isEmpty){
                            return 'Last Name tidak boleh kosong';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value){
                          setState(() {
                            pass1 = value!;
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            pass1 = value!;
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.isEmpty){
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Repeat Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: "Repeat Password",
                          labelText: "Repeat Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              togglePasswordView();
                            },
                            child: Icon(isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value){
                          setState(() {
                            pass2 = value!;
                          });
                        },
                        onSaved: (String? value){
                          setState(() {
                            pass2 = value!;
                          });
                        },
                        validator: (String? value){
                          if (value == null || value.isEmpty){
                            return 'Password tidak boleh kosong';
                          }
                          else if (value != pass1) {
                            return 'Password tidak sama';
                          }
                          return null;
                        },
                      )
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
                              backgroundColor: MaterialStateProperty.all(AppTheme.tagRed),
                            ),
                            onPressed: () async {
                              if (_registerFormKey.currentState!.validate()){
                                final response = await request.post("https://pbp-d04.up.railway.app/authentication/registerpasien/registerFlutterPasien/",
                                convert.jsonEncode(
                                {
                                  'username' : username,
                                  'email' : email,
                                  'first_name' : fName,
                                  'last_name' : lName,
                                  'password1' : pass1,
                                  'password2' : pass2,
                                }));
                                if (response['status'] == 'success'){
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content: Text("Akun Untuk Pasien Berhasil Dibuat"),
                                    ));
                                    Navigator.pushReplacementNamed(context, "/login");
                                } else if (response['status'] == 'isTaken'){
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Username sudah ada silahkan memilih username lainnya"
                                      ),
                                    ));                             
                                } else {
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Register error, silahkan coba lagi"
                                      ),
                                    ));
                                }
                              }
                            },
                            child: const Text(
                              "Register Sebagai Pasien",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
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
                              backgroundColor: MaterialStateProperty.all(AppTheme.tagRed),
                            ),
                            onPressed: () async {
                              if (_registerFormKey.currentState!.validate()){
                                final response = await request.post("https://pbp-d04.up.railway.app/authentication/registerdokter/registerFlutterDokter/",
                                convert.jsonEncode(
                                {
                                  'username' : username,
                                  'email' : email,
                                  'first_name' : fName,
                                  'last_name' : lName,
                                  'password1' : pass1,
                                  'password2' : pass2,
                                }));
                                if (response['status'] == 'success'){
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content: Text("Akun Untuk Dokter Berhasil Dibuat"),
                                    ));
                                    Navigator.pushReplacementNamed(context, "/login");
                                } else if (response['status'] == 'isTaken'){
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Username sudah ada silahkan memilih username lainnya"
                                      ),
                                    ));                             
                                } else {
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Register error, silahkan coba lagi"
                                      ),
                                    ));
                                }
                              }
                            },
                            child: const Text(
                              "Register Sebagai Dokter",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                   onPressed: () {
//                     Uri url = Uri.parse(
//                         "https://pbp-d04.up.railway.app/authentication/registerpasien/");
//                     launchUrl(url);
//                   },
//                   child: const Text("Register sebagai Pasien",
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                   onPressed: () {
//                     Uri url = Uri.parse(
//                         "https://pbp-d04.up.railway.app/authentication/registerdokter/");
//                     launchUrl(url);
//                   },
//                   child: const Text("Register sebagai Dokter",
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
