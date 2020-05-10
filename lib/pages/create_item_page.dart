import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:barcode_scan/barcode_scan.dart';

class CreateItemPage extends StatefulWidget {
  @override
  _CreateItemPageState createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  String _name;
  double _price;
  String _description;
  double _inventorySize;
  int _barcode;
  BarcodeFormat _barcodeFormat;

  TextEditingController _barcodeEntryController = TextEditingController();

  void scanBarcode() async {
    var result = await BarcodeScanner.scan();
    print("SCANNED BARCODE");
    print(
        "Type: ${result.type}"); // The result type (barcode, cancelled, failed)
    print("Content: ${result.rawContent}"); // The barcode content
    print("Format: ${result.format}"); // The barcode format (as enum)
    print(
        "Format Note: ${result.formatNote}"); // If a unknown format was scanned this field contains a note

    _barcodeFormat = result.format;
    // Acceptable barcode
    if (_barcodeFormat != BarcodeFormat.qr &&
        _barcodeFormat != BarcodeFormat.unknown) {
      _barcode = int.parse(result.rawContent);

      setState(() {
        _barcodeEntryController.text = result.rawContent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Create an Item'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView(
              children: <Widget>[
                // Name and Price input Card
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Product Name", style: kTextFieldLabelStyle),
                        TextField(
                          onChanged: (String value) => _name = value,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: "Enter your product's name"),
                        ),
                        SizedBox(height: 20.0),
                        Text('Price', style: kTextFieldLabelStyle),
                        TextField(
                          onChanged: (String value) =>
                              _price = double.parse(value),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: kTextFieldDecoration,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // Details input (description, inventory count, barcode)
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Description", style: kTextFieldLabelStyle),
                        TextField(
                          onChanged: (String value) => _description = value,
                          decoration: kTextFieldDecoration,
                        ),
                        SizedBox(height: 20.0),
                        Text('Number of Units', style: kTextFieldLabelStyle),
                        TextField(
                          onChanged: (String value) =>
                              _inventorySize = double.parse(value),
                          keyboardType: TextInputType.number,
                          decoration: kTextFieldDecoration,
                        ),
                        SizedBox(height: 20.0),
                        Text('Barcode', style: kTextFieldLabelStyle),
                        ListTile(
                          contentPadding:
                              EdgeInsets.only(left: -3.0, top: -3.0),
                          trailing: IconButton(
                            onPressed: () {
                              scanBarcode();
                            },
                            icon: SvgPicture.asset(
                                // https://thenounproject.com/term/barcode-scanner/547392/
                                'assets/icon/barcode_scanner_icon.svg'),
                          ),
                          title: TextField(
                            controller: _barcodeEntryController,
                            onChanged: (String value) =>
                                _barcode = int.parse(value),
                            keyboardType: TextInputType.number,
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Item Code'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  // Create Item Button
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.blueAccent,
                    child: Text("Create Item".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  isDense: true,
  focusColor: Colors.blueAccent,
  //hintStyle: TextStyle(color: Colors.grey),
);

const kTextFieldLabelStyle = TextStyle(fontSize: 14.0, color: Colors.black87);

// Center(
//        child: Material(
//          elevation: 5.0,
//          borderRadius: BorderRadius.circular(10.0),
//          color: Colors.blueAccent,
//          child: FlatButton(
//            onPressed: scanBarcode,
//            child: Text(
//              "Scan an Item",
//              style: TextStyle(fontSize: 18.0, color: Colors.white),
//            ),
//          ),
//        ),
//      ),

// Material(
//                  elevation: 5.0,
//                  // borderRadius: BorderRadius.circular(10.0),
//                  color: Colors.blueAccent,
//                  child: FlatButton(
//                    onPressed: () => null,
//                    child: Text(
//                      "Create Item",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10.0),
//                        side: BorderSide(color: Colors.blueAccent)),
//                  ),
//                )
