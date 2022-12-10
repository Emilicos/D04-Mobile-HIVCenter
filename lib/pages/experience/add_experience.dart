import 'package:flutter/material.dart';
import 'package:tk_akhir/app_theme.dart';
import 'package:tk_akhir/pages/experience/experience.dart';
import 'package:tk_akhir/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class AddExperiencePage extends StatefulWidget {
  const AddExperiencePage({super.key});

  @override
  State<AddExperiencePage> createState() => _AddExperiencePageState();
}

class _AddExperiencePageState extends State<AddExperiencePage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String preview = '';
  String experience = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Form Experience',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
      ),
      // Adding drawer menu
      drawer: const DrawerClass('Add Budget'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(128, 212, 196, 1),
                        ),
                      ),
                      hintText: "Title",
                    ),

                    onChanged: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty!';
                      } else if (value.length > 100) {
                        return 'Judul tidak boleh lebih dari 100 karakter';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(128, 212, 196, 1),
                        ),
                      ),
                      hintText: "Experience",
                    ),

                    onChanged: (String? value) {
                      setState(() {
                        experience = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        experience = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Experience cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.lightPink),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await request.post(
                          "https://pbp-d04.up.railway.app/experience/create-experience/",
                          {
                            "title": title,
                            "preview": "",
                            "experience": experience
                          }).then(
                          (value) => {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15,
                                      child: ListView(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          const Center(
                                              child: Text(
                                                  'Data sudah berhasil dibuat')),
                                          const SizedBox(height: 20),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MyExperiencePage(
                                                              title: '')));
                                            },
                                            child: const Text('Kembali'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              },
                          onError: (error) => {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15,
                                      child: ListView(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          const Center(
                                              child: Text('Data Gagal dibuat')),
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
                                )
                              });
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
