import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:toto_real/Tabs/VideoChatScreen/Widgets/loading_ind.dart';

enum ImageDownloadState { Idle, GettingURL, Downloading, Done, Error }

class firebaseStorageImage extends StatefulWidget {
  /// The reference of the image that has to be loaded.
  final StorageReference reference;
  /// The widget that will be displayed when loading if no [placeholderImage] is set.
  final Widget fallbackWidget = ShowLoading();
  /// The widget that will be displayed if an error occurs.
  final Widget errorWidget;
  /// The image that will be displayed when loading if no [fallbackWidget] is set.
  final ImageProvider placeholderImage = AssetImage('assets/test1.jpg');

  firebaseStorageImage(
      {Key key,
        @required this.reference,
        @required this.errorWidget,
        fallbackWidget,
        placeholderImage}) {
    assert(
    (this.fallbackWidget == null && this.placeholderImage != null) ||
        (this.fallbackWidget != null && this.placeholderImage == null),
    "Either [fallbackWidget] or [placeholderImage] must not be null.");
  }

  @override
  _firebaseStorageImageState createState() => _firebaseStorageImageState(
      reference, fallbackWidget, errorWidget, placeholderImage);
}

class _firebaseStorageImageState extends State<firebaseStorageImage>
    with SingleTickerProviderStateMixin {
  _firebaseStorageImageState(StorageReference reference, fallbackWidget,
      this.errorWidget, placeholderImage) {
    var url = reference.getDownloadURL();
    this._imageDownloadState = ImageDownloadState.GettingURL;
    url.then(this._setImageData).catchError((err) {
      this._setError();
    });
  }

  /// The widget that will be displayed when loading if no [placeholderImage] is set.
  Widget fallbackWidget = ShowLoading();
  /// The widget that will be displayed if an error occurs.
  final Widget errorWidget;
  /// The image that will be displayed when loading if no [fallbackWidget] is set.
  ImageProvider placeholderImage = AssetImage('assets/test1.jpg');

  /// The image that will be/has been downloaded from the [reference].
  Image _networkImage;
  /// The state of the [_networkImage].
  ImageDownloadState _imageDownloadState = ImageDownloadState.Idle;

  /// Sets the [_networkImage] to the image downloaded from [url].
  void _setImageData(dynamic url) {
    this._networkImage = Image.network(url);
    this
        ._networkImage
        .image
        .resolve(ImageConfiguration());
    //    .addListener((_, __) {
   //   if (mounted)
   //     setState(() => this._imageDownloadState = ImageDownloadState.Done);
   // });
    if (this._imageDownloadState != ImageDownloadState.Done)
      this._imageDownloadState = ImageDownloadState.Downloading;
  }

  /// Sets the [_imageDownloadState] to [ImageDownloadState.Error] and redraws the UI.
  void _setError() {
    if (mounted)
      setState(() => this._imageDownloadState = ImageDownloadState.Error);
  }

  @override
  Widget build(BuildContext context) {
    switch (this._imageDownloadState) {
      case ImageDownloadState.Idle:
      case ImageDownloadState.GettingURL:
      case ImageDownloadState.Downloading:
        return Image(image: this.placeholderImage) ?? this.fallbackWidget;
      case ImageDownloadState.Error:
        return this.errorWidget;
      case ImageDownloadState.Done:
        return this._networkImage;
        break;
      default:
        return this.errorWidget;
    }
  }
}