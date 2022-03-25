import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sportpal/main.dart';

import 'filterFiles.dart';

class RefereeForm extends StatefulWidget {


  const RefereeForm({Key? key}) : super(key: key);

  @override
  _RefereeFormState createState() => _RefereeFormState();
}

class _RefereeFormState extends State<RefereeForm> {

  final items = ["select your sport","Football","Tennis","Basketball","Handball"];
  String? value;

  DropdownMenuItem<String> buildMenuItem(String item)=> DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    );

  bool _uploaded = true;

  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilesPage(
                files: files,
                onOpenedFile: openFile,
              )));

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 360),
                        child: Center(
                          child: Text("Referee", style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: (Colors.grey[100])!))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Price",
                                  hintStyle: TextStyle(color: Colors.grey[400])
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: value,
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value){
                                setState(() {
                                  this.value = value;
                                });

                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    InkWell(
                      onTap: ()async{
                        setState(() {
                          _uploaded=true;
                        });
                        final result = await FilePicker.platform.pickFiles(
                            allowMultiple: true
                        );
                        if(result==null){
                          setState(() {
                            _uploaded=false;
                          });
                          return;
                        }
                        final file = result.files.first;
                        openFiles(result.files);

                      }, child: Text("click here to Upload your files", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Row(
                        children: [
                          Text("files", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1),fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(width: 160,),
                          _uploaded ? Icon(Icons.done,color: Colors.green,size: 28,) : Icon(Icons.pending,color: Colors.red,size: 28,)
                        ],
                      ),
                    ),
                    SizedBox(height: 26,),
                    InkWell(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                            allowMultiple: true
                        );
                        if(result==null) return;
                        final file = result.files.first;
                        openFiles(result.files);
                      },
                      child: Container(
                        
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: Center(
                          child: Text("Send Request", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
