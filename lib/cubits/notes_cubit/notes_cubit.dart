import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';

import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes(){
      try {
        var notesBox = Hive.box<NoteModel>(kNotesBox);
        notes = notesBox.values.toList();
        emit(NotesSuccess(notes!));
      } on Exception catch (e) {
        emit(NotesFailure(e.toString()));
      }
  }
}
