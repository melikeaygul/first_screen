import 'package:first_screen/src/features/posten/presentation/widgest/option_button.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beitrag hinzufügen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OptionButton(
              text: 'Aus Fotos hinzufügen',
              onPressed: () {
                // TODO: Aktion hinzufügen
              },
            ),
            SizedBox(height: 16),
            OptionButton(
              text: 'Aus Dateien hochladen',
              onPressed: () {
                // TODO: Aktion hinzufügen
              },
            ),
            SizedBox(height: 16),
            OptionButton(
              text: 'Kamera öffnen',
              onPressed: () {
                // TODO: Aktion hinzufügen
              },
            ),
          ],
        ),
      ),
    );
  }
}
