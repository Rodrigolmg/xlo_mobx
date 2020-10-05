import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {

  final Function(File) onImageSelected;


  ImageSourceModal(this.onImageSelected);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? BottomSheet(
      onClosing: (){},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            onPressed: getFromCamera,
            child: const Text('Câmera')
          ),
          FlatButton(
            onPressed: getFromGallery,
            child: const Text('Galeria')
          ),
        ],
      )
    ) :
    CupertinoActionSheet(
      title: const Text('Selecionar foto para o anúncio'),
      message: const Text('Escola a origem da foto'),
      cancelButton: CupertinoActionSheetAction(
        child: const Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.red
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: getFromCamera,
          child: const Text('Câmera')
        ),
        CupertinoActionSheetAction(
          onPressed: getFromGallery,
          child: const Text('Galeria')
        ),
      ],
    );
  }

  Future<void> getFromCamera() async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera
    );
    if(pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery
    );
    if(pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar imagem',
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Editar imagem',
        cancelButtonTitle: 'Cancelar',
        doneButtonTitle: 'Concluir'
      )
    );

    if(croppedFile != null)
      onImageSelected(croppedFile);
  }
}
