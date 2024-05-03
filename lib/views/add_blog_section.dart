import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_udyog_admin/views/dashboard/utils/export.dart';
import 'package:provider/provider.dart';

import '../view_models/main_screen_provider.dart';

class AddBlogSection extends StatelessWidget {
  const AddBlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Save As Draft'),
            SizedBox(width: 16),
            BlueButton(text: 'Publish'),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('General'),
              const SizedBox(height: 16),
              const TextFieldWidget(
                labelText: 'Post Title',
              ),
              const SizedBox(height: 16),
              const TextFieldWidget(
                labelText: 'Description',
                isDesc: true,
              ),
              const SizedBox(height: 16),
              MediaPIcker(),
            ],
          ),
        ),
      ],
    );
  }
}

class MediaPIcker extends StatefulWidget {
  const MediaPIcker({
    super.key,
  });

  @override
  State<MediaPIcker> createState() => _MediaPIckerState();
}

class _MediaPIckerState extends State<MediaPIcker> {
  Uint8List? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: LabelText(labelText: 'Media'),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              _pickImage();
            },
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
              ),
              alignment: Alignment.center,
              child: _pickedImage == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.image_outlined,
                            size: 40, color: Colors.grey.shade400),
                        const SizedBox(height: 8),
                        const Text('Upload Image'),
                      ],
                    )
                  : Image.memory(
                      _pickedImage!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        _pickedImage = f;
        print(_pickedImage);
      });
    } else {
      print('No image has been picker.');
    }
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.labelText,
    this.isDesc = false,
    super.key,
  });

  final String labelText;
  final bool isDesc;
  // final String isReq;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: LabelText(labelText: labelText),
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: isDesc ? TextInputType.multiline : TextInputType.text,
          maxLines: isDesc ? 15 : 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: isDesc ? 16 : 0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade600),
            ),
          ),
        ),
      ],
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.labelText,
  });

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: labelText,
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: '*',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
