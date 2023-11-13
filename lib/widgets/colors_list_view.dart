import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_notes_cubit/add_note_cubit.dart';
import 'add_note_form.dart';

class colorsListView extends StatefulWidget {
  const colorsListView({Key? key}) : super(key: key);

  @override
  State<colorsListView> createState() => _colorsListViewState();
}

class _colorsListViewState extends State<colorsListView> {
  int currentIndex = 0;
  List<Color> colors = [
    Color(0xffDEEFB7),
    Color(0xff98DFAF),
    Color(0xff5FB49C),
    Color(0xff414288),
    Color(0xff682D63)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: colorItem(
              isActive: currentIndex == index,
              color: colors[index],
            ),
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              setState(() {});
            },
          );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
