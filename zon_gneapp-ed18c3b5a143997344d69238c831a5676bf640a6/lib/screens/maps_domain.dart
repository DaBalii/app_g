import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zon_gneapp/model/domain.dart';

class mapsDomain extends StatefulWidget {
  final Domain domain;

  mapsDomain({super.key, required this.domain});

  @override
  State<mapsDomain> createState() => _mapsDomainState();
}

class _mapsDomainState extends State<mapsDomain> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _votreprix = TextEditingController();

  String? _selectedImage;

  final ImagePicker picker = ImagePicker();

  void _pickImage() async {
    String? source = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ajouter une image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('gallery');
                },
                child: Text("Sélectionner depuis la galerie"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('camera');
                },
                child: const Text("Ouvrir la caméra"),
              ),
            ],
          ),
        );
      },
    );

    if (source == null) {
      return;
    }

    ImageSource imageSource =
        source == 'gallery' ? ImageSource.gallery : ImageSource.camera;
    final imagePicked = await picker.pickImage(source: imageSource);
    if (imagePicked != null) {
      setState(() {
        _selectedImage = imagePicked.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.domain.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: "votre numero",
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _votreprix,
                decoration: const InputDecoration(
                  labelText: "prix",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "description",
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 4,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.all(26),
                  alignment: Alignment.center,
                  child: _selectedImage == null
                      ? const Text("cliquer pour envoyer vos recommandation ")
                      : Image.file(
                          File(_selectedImage!),
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
