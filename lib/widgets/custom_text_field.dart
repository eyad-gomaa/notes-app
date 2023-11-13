import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.HintText, this.MaxLines = 1, this.onSaved, this.onCahnged}) : super(key: key);
final String HintText ;
final int MaxLines;
final Function(String)? onCahnged;
final  Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if (value?.isEmpty?? true){
          return 'field is required';
        }else{
          return null;
        }
      },
      maxLines: MaxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: "$HintText",
        border: buildBorder(),
        focusedBorder: buildBorder(color: kPrimaryColor),
        enabledBorder: buildBorder(),

      ),
      onChanged: onCahnged,
    );
  }

  OutlineInputBorder buildBorder({color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        )
    );
  }
}
