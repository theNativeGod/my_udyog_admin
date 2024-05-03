import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../models/blog.dart';

class AddBlogProvider with ChangeNotifier {
  String _title = '';
  String _description = '';
  Uint8List? _image;
}
