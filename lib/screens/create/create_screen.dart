import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/create/image_field.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class CreateScreen extends StatelessWidget {

  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {

    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    final contendPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);


    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar anúncio'),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageField(createStore: createStore),
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                  labelText: 'Título *',
                  labelStyle: labelStyle,
                  contentPadding: contendPadding
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                    labelText: 'Descrição *',
                    labelStyle: labelStyle,
                    contentPadding: contendPadding
                ),
                maxLines: null,
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                    labelText: 'Categoria *',
                    labelStyle: labelStyle,
                    contentPadding: contendPadding
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                    labelText: 'CEP *',
                    labelStyle: labelStyle,
                    contentPadding: contendPadding
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                decoration: InputDecoration(
                  labelText: 'Preço *',
                  labelStyle: labelStyle,
                  contentPadding: contendPadding,
                  prefix: Text('R\$')
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
