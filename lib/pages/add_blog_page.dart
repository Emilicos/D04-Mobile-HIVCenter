import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String opening = "";
  String main = "";
  String closing = "";
  String importance = "";
  String importanceValue = "";
  List<String> pilihan = ["Low", "Intermediate", "High"];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(title: const Text("Add Blog")),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Title",
                        labelText: "Title Blogpost",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Title tidak boleh kosong!';
                        } else if (value.length > 100) {
                          return 'Judul tidak boleh lebih dari 100 karakter';
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
                      "Opening",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Opening",
                        labelText: "Opening Blogpost",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          opening = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          opening = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Opening tidak boleh kosong!';
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
                      "Main",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Main",
                        labelText: "Main Blogpost",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          main = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          main = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Main tidak boleh kosong!';
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
                      "Closing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Closing",
                        labelText: "Closing Blogpost",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          closing = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          closing = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Closing tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 150,
                  child: Column(children: [
                    const Text(
                      "Importance",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField(
                      value: importance != "" ? importance : null,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: pilihan.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue == "High") {
                            importanceValue = "HH";
                            importance = newValue!;
                          } else if (newValue == "Intermediate") {
                            importanceValue = "IM";
                            importance = newValue!;
                          } else if (newValue == "Low") {
                            importanceValue = "LW";
                            importance = newValue!;
                          }
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Pilih Dropdown dulu!';
                        }
                        return null;
                      },
                      hint: const Text(
                        "Pilih Jenis",
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
                                  if (_formKey.currentState!.validate()) {
                                    await request.post(
                                        "https://pbp-d04.up.railway.app/blogpost/create/",
                                        {
                                          "title": title,
                                          "opening": opening,
                                          "main": main,
                                          "closing": closing,
                                          "importance": importanceValue
                                        }).then(
                                        (value) => {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 15,
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        const Center(
                                                            child: Text(
                                                                'Data sudah berhasil dibuat')),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator
                                                                .popAndPushNamed(
                                                                    context,
                                                                    "/blogpost");
                                                          },
                                                          child: const Text(
                                                              'Kembali'),
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 15,
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        const Center(
                                                            child: Text(
                                                                'Data Gagal dibuat')),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Kembali'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )
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
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
