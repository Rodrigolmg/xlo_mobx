import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/create/image_dialog.dart';
import 'package:xlo_mobx/components/create/image_source_modal.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class ImageField extends StatelessWidget {

  ImageField({this.createStore});

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {

    void onImageSelected(File image){
      createStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(builder: (_) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: createStore.images.length < 2 ? createStore.images.length + 1 : 2,
          itemBuilder: (_, index){

            return index == createStore.images.length ? Padding(
              padding:  const EdgeInsets.fromLTRB(8, 16, 0, 16),
              child: GestureDetector(
                onTap: () {
                  if(Platform.isAndroid){
                    showModalBottomSheet(
                        context: context,
                        builder: (_) => ImageSourceModal(onImageSelected)
                    );
                  } else {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (_) => ImageSourceModal(onImageSelected)
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ) :
            Padding(
              padding: EdgeInsets.fromLTRB(8, 16, index == 4 ? 8 : 0, 16),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => ImageDialog(
                      image: createStore.images[index],
                      onDelete: () => createStore.images.removeAt(index)
                    )
                  );

                },
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: FileImage(createStore.images[index]),
                ),
              ),
            );
          }
        )
      ),
    );
  }
}
