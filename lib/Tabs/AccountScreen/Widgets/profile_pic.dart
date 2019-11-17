import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:toto_real/Tabs/AccountScreen/Models/account_model.dart';

class ProfilePic extends StatelessWidget {
  final String photoURL;
  ProfilePic(this.photoURL);

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

    /// Gets an image from the camera roll
    Future<void> getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image == null)
        return;
      else {
        uploadImage(image);
      }
    }

    Future<NetworkImage> getImageFromDB(String path) async {
      print('getting FirebaseStorage');
      StorageReference storageRef = FirebaseStorage.instance.ref().child(path);
      var url = await storageRef.getDownloadURL();
      url.toString();
      print('got the url ${url}');
      return NetworkImage(url);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: InkWell(
        onTap: getImage,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: newURL.photoURL == '' ? NetworkImage("https://icon-library.net/images/person-icon-silhouette-png/person-icon-silhouette-png-11.jpg") : NetworkImage("https://statici.behindthevoiceactors.com/behindthevoiceactors/_img/chars/goku-son-kakarot-dragon-ball-super-broly-1.91.jpg")
            )
          ),
        ),
      )
    );
  }
}