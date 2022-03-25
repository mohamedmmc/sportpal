import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportpal/Model/User.dart';


class TinderCard extends StatefulWidget {

  final User user;
  const TinderCard({Key? key, required this.user}) : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:NetworkImage(widget.user.profilePic!),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent,Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7,1]
              )
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  buildName(),
                  SizedBox(height: 8,),
                  buildStatus()],
              ),
            ),
          ),
        ),
      ),

    );
  }

  buildName() => Row(
        children: [
          Text(
            widget.user.fullName!,
            style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            "${widget.user.birthDate!}",
            style: TextStyle(fontSize: 32,
                color: Colors.white),
          )
        ],
      );

  Widget buildStatus() => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green
            ),
            width: 12,
            height: 12,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "Recently Active",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      );
}
