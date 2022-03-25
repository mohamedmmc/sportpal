import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signUp/Spassword.dart';
import 'package:sportpal/Controller/authentification/signUp/Sphotoprofil.dart';
import '../authentificationWidgets/Widgets/customInputBox.dart';



class RegisterSexe extends StatefulWidget {
  const RegisterSexe({Key? key, required this.email, required this.name, required this.phone}) : super(key: key);
final String email;
final String name;
final String phone;
  @override
  _RegisterSexeState createState() => _RegisterSexeState();
}

class _RegisterSexeState extends State<RegisterSexe> {

  String _gender =  "";
  bool isTrue = false;
  Future<void> _continueBtnColor() async {
    setState(() {
      isTrue = true;
    });
  }

  bool  isManTrue = false;
  bool  isWomanTrue = false;

  Future<void> _ButtoncolorMan() async {
    setState(() {
      _gender = "homme";
      isManTrue=true;
      isWomanTrue=false;
    });
  }
  Future<void> _ButtoncolorWoman() async {
    setState(() {
      _gender = "woman";
      isManTrue=false;
      isWomanTrue=true;
    });
  }

  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    bool isActive = false;

    bool Ff = true;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              value: 0.83,
              color: Color(0xff0962ff),
            ),
            Padding(padding:  EdgeInsets.fromLTRB(30, 50, 0, 0)
              ,child: Text(
                "Selecting",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            Padding(padding:  EdgeInsets.fromLTRB(30, 10, 0, 0)
              ,child: Text(
                "my gender",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            SizedBox(height: 100,),
            InkWell(
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: isManTrue ? Color.fromRGBO(49, 39, 79, 1) : Colors.white,
                ),
                child: Center(
                  child: Text("Man", style: TextStyle(letterSpacing: 3,
                    color: isManTrue ? Colors.white : Color.fromRGBO(49, 39, 79, 1),
                  ),),
                ),
              ),
              onTap: (){
                _continueBtnColor();
                _ButtoncolorMan();
              },
            ),
            SizedBox(height: 18,),
            InkWell(
              onTap: () {
                _continueBtnColor();
                _ButtoncolorWoman();
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: isWomanTrue ?  Color.fromRGBO(49, 39, 79, 1) : Colors.white  ,
                ),
                child: Center(
                  child: Text("Woman", style: TextStyle(
                      color: isWomanTrue ? Colors.white : Color.fromRGBO(49, 39, 79, 1)   ,
                    letterSpacing: 3
                  ),),
                ),
              ),
            ),

            SizedBox(height: 200,),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPhotoprofil(phone: widget.phone,email: widget.email,name: widget.name,gender: _gender,)));
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
    );
  }

}
