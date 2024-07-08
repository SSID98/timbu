import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton(
      {super.key, this.colour, this.label, required this.onPress});

  final String? label;
  final Color? colour;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.amber,
                offset: Offset(0.0, 0.0),
                blurRadius: 8.0,
                spreadRadius: 0.1,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(CupertinoIcons.trash, color: Colors.amber[800], size:20.0,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: MaterialButton(
                    onPressed: onPress,
                    height: 42.0,
                    child: FittedBox(
                      child: Text(
                        label!,
                        style: TextStyle(color: Colors.amber[800], fontSize: 15.0),
                        // 'Log In',
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
