import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constantes/constantes.dart';

class UPImageProvider extends ChangeNotifier {
  bool cameraSelectPicture = false;
  bool pictureIsSelected = false;
  File? image;
  bool isfavorite = false;

  //cambiar el valor de favorito

  changeisfavorite() {
    isfavorite = !isfavorite;
    notifyListeners();
  }

  //
  setimage() {
    image = null;
    notifyListeners();
  }

  File convertToFile(XFile xFile) => File(xFile.path);

  Future<void> selectPicture(BuildContext context, bool camara) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
        source: camara ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      print(await pickedFile.length());

      //convertir de xfile a file
      var img = convertToFile(pickedFile);

      print("Imagen sin comprimida${img.length()}");

      image = await testCompressAndGetFile(
        img,
        "${img.path}.jpg",
      );

      print("Imagen comprimida${image!.length()}");

      pictureIsSelected = true;

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

  //////////////////////////////////////////////////comprimir///imagen
  ///
  ///
  ///
  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      //ajustar taza de compresion
      quality: 30,
    );

    return result!;
  }
}
