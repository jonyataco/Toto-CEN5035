import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:toto_real/Tabs/AccountScreen/Models/account_model.dart';

class Camera extends StatelessWidget {
  Widget build(BuildContext context) {
    final newURL = Provider.of<AccountModel>(context);

    /// Uploads an image to the firebase storage.
    void uploadImage(var image) {
      String fileName = basename(image.path);
      StorageReference storageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = storageRef.putFile(image);
      /* When the upload is complete in the storage database, then set the URL
       * path in database
       */
      uploadTask.onComplete.then((value) {
        newURL.photoURL = fileName;
      });
    }

    /// Gets an image using the camera
    Future<void> getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      if (image == null)
        return;
      else {
        uploadImage(image);
      }
    }

    return Center(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Icon(
            Icons.camera_alt,
            size: 36,
          ),
        ),
        onTap: getImage,
      )
    );
  }
}