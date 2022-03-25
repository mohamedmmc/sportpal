import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Sphone.dart';




class RegisterAge extends StatefulWidget {
  const RegisterAge({Key? key, required this.email, required this.name}) : super(key: key);
  final String email;
  final String name;
  @override
  _RegisterAgeState createState() => _RegisterAgeState();
}

class _RegisterAgeState extends State<RegisterAge> {
  DateTime birthDate = DateTime.now();
  int? age;
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


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              value: 0.498,
              color: Color(0xff0962ff),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(30, 50, 0, 0)
              ,child: Text(
                "My",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            Padding(padding: const EdgeInsets.fromLTRB(30, 10, 0, 0)
              ,child: Text(
                "Age is ",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Center(
                child: Column(

                  children: <Widget>[
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {

                          _selectDate(context);

                        });
                      },

                      child: Text("Choose Date"),
                    ),
                    Text(DateFormat("yyyy-MM-dd").format(birthDate)),
                    Text("your age is "+age.toString())
                  ],
                ),
              ),
            ),



            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your age will be public ',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8f9db5).withOpacity(0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPhone(name: widget.name,email: widget.email,birthDate: birthDate,)));
                  setState(() {
                    isTrue = !isTrue;
                  });
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
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != birthDate) {
      setState(() {
        age = DateTime.now().year-selected.year;
        birthDate = selected;
        print(birthDate);

      });
    }
  }
}
