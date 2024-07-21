import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Nav-bars/bottom.dart';
import '../Nav-bars/top.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _usedDurationController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadItem() async {
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select an image.')),
        );
        return;
      }

      final fileName = _image!.path.split('/').last;
      final destination = 'files/$fileName';

      try {
        final ref = FirebaseStorage.instance.ref(destination);
        await ref.putFile(_image!);
        final downloadURL = await ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('thrift_items').add({
          'title': _titleController.text,
          'price': _priceController.text,
          'material': _materialController.text,
          'usedDuration': _usedDurationController.text,
          'condition': _conditionController.text,
          'imageURL': downloadURL,
          'sellerName': _nameController.text,
          'sellerContact': _contactController.text,
          'sellerAddress': _addressController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item uploaded successfully!')),
        );

        _formKey.currentState!.reset();
        setState(() {
          _image = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload item: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Pass It On',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Share Style, Sustainably',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _materialController,
                  decoration: InputDecoration(labelText: 'Material'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the material.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _usedDurationController,
                  decoration: InputDecoration(labelText: 'Used Duration'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the used duration.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _conditionController,
                  decoration: InputDecoration(labelText: 'Condition (Like New, Good)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the condition.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _image == null
                    ? Text('No image selected.')
                    : Image.file(_image!, height: 200),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Select Image'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB99A45),
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  'Seller Details',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(labelText: 'Contact'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadItem,
                  child: Text('Upload Item'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB99A45),
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(pageBackgroundColor: Colors.white, currentIndex: 0),
    );
  }
}