
import 'package:flutter/cupertino.dart';

class UserMessage extends StatelessWidget {
  final String text;
  final Color color;
  final Icon icon;
  final bool isUser;
  const UserMessage({
    Key? key,
    required this.text, required this.color, required this.icon, required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:isUser? 18:0,right:isUser? 0:18),
      child: Container(


        decoration: BoxDecoration(
          borderRadius:  BorderRadius.only(topLeft: const Radius.circular(13),topRight: const Radius.circular(13),bottomLeft: isUser? const Radius.circular(13): const Radius.circular(0),bottomRight:isUser? const Radius.circular(0): const Radius.circular(13)),
          color: color,

        ),
        padding:  EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 3,
            top: 8,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xffd1d5db),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}