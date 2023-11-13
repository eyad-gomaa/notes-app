import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import '../cubits/add_notes_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'Custom_Button.dart';
import 'colors_list_view.dart';

class addNoteForm extends StatefulWidget {
  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            HintText: "Title",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            HintText: "Content",
            MaxLines: 15,
          ),
          const SizedBox(
            height: 30,
          ),
          const colorsListView(),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      var currentDate = DateTime.now();
                      var formatedDate =
                          DateFormat("dd-mm-yyyy").format(currentDate);
                      formKey.currentState!.save();
                      NoteModel note = NoteModel(
                          title!,
                          subtitle!,
                          formatedDate.toString(),
                          Colors.lightBlueAccent.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                      Navigator.pop(context);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  });
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class colorItem extends StatelessWidget {
  const colorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 27,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 30,
            ),
          );
  }
}

