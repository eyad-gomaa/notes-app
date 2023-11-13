import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import 'add_note_form.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title, content;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            CustomAppBar(
              title: "Edit Note",
              appBarIcon: const Icon(Icons.done),
              onTap: (){
                widget.note.title = title ?? widget.note.title ;
                widget.note.subTitle = content ?? widget.note.subTitle ;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 25,
            ),
             CustomTextField(
                HintText: "Titile",
              onCahnged: (value){
                  title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
             CustomTextField(
              HintText: "Content",
              MaxLines: 15,
              onCahnged: (value){
                content = value;
              },
            ),
             const SizedBox(
              height: 20,
            ),
            editNotesColorsListView(note: widget.note,)
          ],
        ),
      ),
    );
  }
}

class editNotesColorsListView extends StatefulWidget {
  const editNotesColorsListView({Key? key, required this.note}) : super(key: key);
final NoteModel note;
  @override
  State<editNotesColorsListView> createState() => _editNotesColorsListViewState();
}

class _editNotesColorsListViewState extends State<editNotesColorsListView> {
  late int currentIndex ;
  List<Color> colors = [
    Color(0xffDEEFB7),
    Color(0xff98DFAF),
    Color(0xff5FB49C),
    Color(0xff414288),
    Color(0xff682D63)
  ];

  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }
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
              widget.note.color = colors[index].value;
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
