import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  EditNoteView(note: note,);
        }));
      },
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:  Text(
                  "${note.title}",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                contentPadding: const EdgeInsets.only(bottom: 15),
                subtitle: Text(
                  "${note.subTitle}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 20,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("${note.date}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 16,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
