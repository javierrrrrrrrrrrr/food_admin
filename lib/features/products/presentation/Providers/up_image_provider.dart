import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constantes/constantes.dart';

class UPImageProvider extends ChangeNotifier {
  bool gallerySelectPicture = false;
  bool pictureIsSelected = false;
  File? image;

  File convertToFile(XFile xFile) => File(xFile.path);

  Future<void> selectPicture(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      //convertir de xfile a file
      image = convertToFile(pickedFile);
      pictureIsSelected = true;
      print(image);
      notifyListeners();
    }
  }

  Future<bool> uploadImage({required int id}) async {
    //circular progfress indicator

    var request = http.MultipartRequest(
        'PUT', Uri.parse('${apiUrl}uploads/products/$id'));
    request.files.add(await http.MultipartFile.fromPath(
        'archivo', image!.path)); //image es el file que se sube'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
