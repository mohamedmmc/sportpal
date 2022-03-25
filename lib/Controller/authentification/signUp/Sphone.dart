import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signUp/Ssexe.dart';
import '../authentificationWidgets/Widgets/customInputBox.dart';
import '../authentificationWidgets/Widgets/numberInputBox.dart';



class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key, required this.email, required this.name,  this.birthDate}) : super(key: key);
final String email;
final String name;
final DateTime? birthDate;
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _checked = true;
  bool isTrue = false;
  Future<void> _continueBtnColor() async {
    setState(() {
      isTrue = true;
    });
  }
  Future<void> _continueBtnColor2() async {
    setState(() {
      isTrue = false;
    });
  }
  @override

  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;


    String _phone = "";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key : _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              LinearProgressIndicator(
                backgroundColor: Colors.white,
                value: 0.664,
                color: Color(0xff0962ff),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(30, 50, 0, 0)
                ,child: Text(
                  "Set phone",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.blue[800],
                      fontSize: 35,
                      fontFamily: 'Cardo'
                  ),
                ),),
              Padding(padding: const EdgeInsets.fromLTRB(30, 10, 0, 0)
                ,child: Text(
                  "number  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.blue[800],
                      fontSize: 35,
                      fontFamily: 'Cardo'
                  ),
                ),),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextFormField(
                  onChanged: (String? value){
                    if(value!.isNotEmpty){
                      _continueBtnColor();
                    }else{
                      _continueBtnColor2();
                    }
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone number is Required';
                    }

                    return null;
                  },
                  onSaved: (String? value) {
                    _phone = value!;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'phone',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "XXXXXXXX",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[350],
                        fontWeight: FontWeight.w600),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                  ),
                ),
              ),


              SizedBox(height: 230,),
              CheckboxListTile(
                title: Text(
                    "This information will be public",
                    style: TextStyle(fontFamily: 'ProductSans',color: Colors.grey)
                ),
                secondary: Icon(Icons.public),
                controlAffinity: ListTileControlAffinity.leading,
                value: _checked,
                activeColor: Colors.green,
                checkColor: Colors.black,
                onChanged: (bool? value) {
                  setState(() {
                    _checked = value!;
                  });
                },
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }else{
                      _formKey.currentState!.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterSexe(email: widget.email,name: widget.name,phone: _phone,)));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: scrWidth * 0.80,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isTrue ? Color(0xff0962ff) : Colors.grey,
                      ),
                      color: isTrue ? Color(0xff0962ff) : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isTrue ?  Colors.white : Colors.grey ,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
