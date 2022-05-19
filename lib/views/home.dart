import 'package:flutter/material.dart';
import 'package:qr_code_generator/controllers/qr_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: QRController().getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: snapshot.data!,
                  padding: EdgeInsets.all(50),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {}),
                  child: Text("Reload"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
