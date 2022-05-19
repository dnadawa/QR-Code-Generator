import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:qr_code_generator/services/database_service.dart';
import 'package:http/http.dart' as http;

class QRController{

  final _databaseService = DatabaseService();

  Future<String> getData() async {

    String qrString = "";

    var sub = await _databaseService.getExcelFile();
    String fileUrl = sub.docs[0]['url'];

    final http.Response responseData = await http.get(Uri.parse(fileUrl));
    Uint8List bytes = responseData.bodyBytes;

    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        for (var cell in row){
          if (cell != null){
            qrString += cell.value + " ";
          }
        }

        qrString += '\n';
      }
    }

    return qrString;
  }

}