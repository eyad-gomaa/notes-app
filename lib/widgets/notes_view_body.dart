import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import 'Notes_List_view.dart';
import 'custom_app_bar.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(children: [
        SizedBox(
          height: 25,
        ),
        CustomAppBar(title:"Notes",appBarIcon: Icon(Icons.search),),
        Expanded(child: NotesListView()),
      ]),
    );
  }
}



