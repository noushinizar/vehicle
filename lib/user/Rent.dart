import 'dart:convert';
import 'dart:io';
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle/Api_service/Api.dart';
import 'package:vehicle/user/Home.dart';
import 'package:vehicle/widgets/background-image.dart';
import 'package:vehicle/widgets/rounded-button.dart';
import 'package:vehicle/widgets/text-field-input.dart';
import 'package:http/http.dart' as http ;
class rent extends StatefulWidget {
  const rent({Key? key}) : super(key: key);

  @override
  State<rent> createState() => _rentState();
}
File? image;
File? imageFile;
late final _filename;
bool _isLoading = false;
class _rentState extends State<rent> {

  void addComplaint()async {
    setState(() {
      _isLoading = true;
    });

    var data = {

    };
    print(data);
    // if(data.image){
    //   var res = await Api().authData(data.image, '/upload');
    //
    // }
    var res = await Api().authData(data, '');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      print(body);
      addvehicleImage();
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(
        this.context, //add this so it uses the context of the class
        MaterialPageRoute(
          builder: (context) =>
          Home(),
        ), //MaterialpageRoute
      );
      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
  void addvehicleImage()async {
    setState(() {
      _isLoading = true;
    });
    final uri = Uri.parse('http://192.168.43.28:3000/complaint/upload-image');
    final request = http.MultipartRequest('POST', uri);
    final imageStream = http.ByteStream(imageFile!.openRead());
    final imageLength = await imageFile!.length();

    final multipartFile = http.MultipartFile(
      'file',
      imageStream,
      imageLength,
      filename: _filename,
    );
    request.files.add(multipartFile);

    print("multipart${multipartFile}");
    final response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "success",
        backgroundColor: Colors.grey,
      );

      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));

    }
    else {
      Fluttertoast.showToast(
        msg: "Failed",
        backgroundColor: Colors.grey,
      );
    }
  }




  Future<void> _showChoiceDialog(BuildContext context) {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                InkWell(
                    onTap: () {
                      _getFromGallery();
                    },
                    child: Text("gallery")),
                InkWell(
                    onTap: () {
                      _getFromCamera();
                    },
                    child: Text("camera")),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgimage.jpg'),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Rent Your Vehicle',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Container(
                  /* decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bg.jpg')
                      )
                    ),*/
                  child: imageFile == null
                      ? Container(
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            //    _getFromGallery();
                            _showChoiceDialog(context);
                          },
                          child: Text("Upload Image"),
                        ),
                        Container(
                          height: 40.0,
                        ),

                      ],
                    ),
                  ) : Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Image.file(
                          imageFile!,
                          width: 100,
                          height: 100,
                          //  fit: BoxFit.cover,
                        ),
                      ), ElevatedButton(
                        onPressed: () {
                          //    _getFromGallery();
                          _showChoiceDialog(context);
                        },
                        child: Text("Upload Image"),
                      ),
                    ],
                  ),
                ),
                TextInputField(
                    icon: Icons.key,
                    hint: 'model',
                    validator:  (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter modelname';
                      } else {
                        return null;
                      }
                    }
                ),
                TextInputField(
                    icon: Icons.key,
                    hint: 'type',
                    validator:  (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter type';
                      } else {
                        return null;
                      }
                    }
                ),
                TextInputField(
                    icon: Icons.attach_money,
                    hint: 'rent amount',
                    validator:  (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter amount';
                      } else {
                        return null;
                      }
                    }
                ),
                RoundedButton(
                  buttonName: 'Submit',
                  onpress: () {

                   // Addfeedback();
                  },)
              ],
            ),
          ),
        )
      ],

    );

}
_getFromGallery() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    setState(()  {

      imageFile = File(pickedFile.path);
    /*  _filename = basename(imageFile!.path);
      final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
      final _extenion = extension(imageFile!.path);
      print("imageFile:${imageFile}");
      print(_filename);
      print(_nameWithoutExtension);
      print(_extenion);*/
    });
  }
}

/// Get from Camera
_getFromCamera() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    setState(() {
      imageFile = File(pickedFile.path);
      /*_filename = basename(imageFile!.path).toString();
      final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
      final _extenion = extension(imageFile!.path);*/
    });
  }
}
}

