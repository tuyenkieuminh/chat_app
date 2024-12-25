// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:googleapis_auth/auth_io.dart';

// class CloudStorageService {
//   final String _bucketName = "chatapp_user_images";
//   final String _serviceAccountPath = "assets/elevated-axon-442412-c5-28db9c6327d8.json";

//   Future<void> uploadImage(File image, String destination) async {
//     final String responseString = await rootBundle.loadString(_serviceAccountPath);
//     final data = await json.decode(responseString);
//     // final serviceAccount = File(_serviceAccountPath).readAsStringSync();
//     final credentials = ServiceAccountCredentials.fromJson(data);

//     final client = await clientViaServiceAccount(
//       credentials,
//       ['https://www.googleapis.com/auth/devstorage.full_control'],
//     );

//     final imageBytes = image.readAsBytesSync();
//     final contentType = "image/${image.path.split('.').last}";

//     final uploadUrl =
//         'https://storage.googleapis.com/upload/storage/v1/b/$_bucketName/o?uploadType=media&name=$destination';

//     final response = await client.post(
//       Uri.parse(uploadUrl),
//       headers: {
//         'Content-Type': contentType,
//       },
//       body: imageBytes,
//     );

//     if (response.statusCode == 200) {
//       print("Tải ảnh lên thành công!");
//     } else {
//       print("Lỗi khi tải ảnh lên: ${response.statusCode}");
//       print("Phản hồi: ${response.body}");
//     }
//     client.close();
//   }
// }