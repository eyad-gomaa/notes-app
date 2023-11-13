import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, required this.isLoading})
      : super(key: key);
  final bool isLoading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Center(
          child: isLoading == true
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ))
              : const Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
