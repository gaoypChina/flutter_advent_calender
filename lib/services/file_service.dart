import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'http.dart' as local_http;

class FileService {
  Future<void> saveImageFromName(String name) async {
    print("trying to save file");
    final response = await http.get(
        Uri.parse(local_http.HttpHelper.ngrokUrlStatic + "/image/" + name));

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    File file = File(join(documentDirectory.path, name));

    await file.writeAsBytes(response.bodyBytes);

    print("Saved file at " + join(documentDirectory.path, name));
  }
}