import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';


class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
          }
          if (state is AddNoteSuccess) {
             BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }
        },
        builder: (context,state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding:  EdgeInsets.only(left: 30,right: 30,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                  child: addNoteForm()
              ),
            ),
          );
        }
      ),
    );
  }
}

