import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note_model.dart';

import '../widgets/Edit_Note_View_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  EditNoteViewBody(note: note,);
  }
}



