import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produtos'),
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocus);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Preço'),
              textInputAction: TextInputAction.next,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              focusNode: _priceFocus,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocus);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              focusNode: _descriptionFocus,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'URL da Imagem'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    focusNode: _imageUrlFocus,
                    controller: _imageUrlController,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: _imageUrlController.text.isEmpty
                      ? const Text('Insira a URL')
                      : FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(_imageUrlController.text),
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
