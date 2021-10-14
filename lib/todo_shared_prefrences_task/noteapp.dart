
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'newnote_page.dart';
import 'notemode.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({Key? key}) : super(key: key);
  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  List<NoteModel> notes = [];
  List<NoteModel> checkedList = [];
  List<NoteModel>? savedList;
  List<NoteModel>? savedCheckList;
  String createdDate = '';
  @override
  void initState() {
    loadData();
    debugPrint('notes = $notes');
    debugPrint('savedList = $savedList');
    debugPrint('savedList = $checkedList');
    debugPrint('savedList = $savedCheckList');
    super.initState();
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('encodedJson') != null) {
      debugPrint(
        " NoteModel.decode(prefs.getString('encodedJson')!) = ${NoteModel.decode(prefs.getString('encodedJson')!)}",
      );
      setState(() {
        savedList = NoteModel.decode(prefs.getString('encodedJson')!);
        notes = savedList!;
        if (prefs.getString('checkedList') != null) {
          savedCheckList = NoteModel.decode(prefs.getString('checkedList')!);
          notes = savedCheckList!;
          checkedList = savedCheckList!;
        }
      });
    }
    debugPrint('savedList = $savedList');
    debugPrint('savedCheckList = $savedCheckList');
  }

  void removeNote(NoteModel note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notes.remove(note);
    prefs.clear();

    setState(() {});
  }

  bool? isChecked = false;
  TextDecoration decoration = TextDecoration.none;

  void insertNote() {
    notes.add(NoteModel(
      content: ' note ${notes.length}',
      date: createdDate,
      isChecked: isChecked!,
    ));
    setState(() {});
  }

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget noteItemView({
    NoteModel? note,
    void Function(bool?)? onChanged,
    bool? value,
    TextDecoration? decoration,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          openNote(noteModel: note);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChanged,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      note!.content ?? '',
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        decoration: decoration,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // ignore: unnecessary_string_interpolations
                      note.date ?? '',
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        decoration: decoration,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => removeNote(note),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openNote({NoteModel? noteModel}) async {
    int? createdYear = DateTime.now().year;
    int? createdMonth = DateTime.now().month;
    int? createdDay = DateTime.now().day;
    int? createdHour = DateTime.now().hour;
    int? createdMinute = DateTime.now().minute;
    int? createdSecond = DateTime.now().second;
    createdDate =
        '$createdYear-$createdMonth-$createdDay $createdHour:$createdMinute:$createdSecond';

    NoteModel _note = noteModel ??
        NoteModel(
          content: 'going to shop',
          date: createdDate,
          isChecked: isChecked!,
        );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewNotePage(_note)),
    ).then((value) {
      if (noteModel == null) {
        debugPrint('createdDate = $createdDate');
        notes.add(_note);
      }
      final String encodedData = NoteModel.encode(
        notes,
      );
      debugPrint('savedList = $savedList');
      prefs.setString("encodedJson", encodedData);
      debugPrint('savedList = $savedList');
      setState(() {});
    });
  }

  Widget buildNotesList() {
    debugPrint('savedList = $savedList');
    return ListView.builder(
      itemBuilder: (_context, index) {
        return noteItemView(
          note: notes[index],
          onChanged: (val) async {
            notes[index].isChecked = val;
            isChecked = notes[index].isChecked;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            setState(() {
              if (isChecked == true) {
                checkedList.add(notes[index]);
                final String savedCheckListEncoded = NoteModel.encode(
                  checkedList,
                );
                debugPrint('savedCheckList = $savedCheckList');
                prefs.setString("checkedList", savedCheckListEncoded);
                debugPrint('savedCheckList = $savedCheckList');

                debugPrint('checkedList = $checkedList');
              } else {}
            });
          },
          decoration: notes[index].isChecked == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          value: notes[index].isChecked,
        );
      },
      itemCount: notes.length,
    );
  }

  Widget buildCheckList() {
    return ListView.builder(
      itemBuilder: (_context, index) {
        return noteItemView(
          note: checkedList[index],
          decoration: checkedList[index].isChecked != null
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          value: checkedList[index].isChecked,
        );
      },
      itemCount: checkedList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = [
      buildNotesList(),
      buildCheckList(),
    ];
    return Scaffold(
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: ' Checked Notes',
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
