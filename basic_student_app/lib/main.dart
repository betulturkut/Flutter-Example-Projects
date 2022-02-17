import 'package:basic_student_app/pages/message_page.dart';
import 'package:basic_student_app/pages/students_page.dart';
import 'package:basic_student_app/pages/teachers_page.dart';
import 'package:basic_student_app/repository/messages_repository.dart';
import 'package:basic_student_app/repository/students_repository.dart';
import 'package:basic_student_app/repository/teachers_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Öğrenci Ana Sayfa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MessagesRepository messagesRepository = MessagesRepository();
  TeacherRepository teacherRepository = TeacherRepository();
  StudentRepository studentRepository = StudentRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextButton(
            onPressed: () {
              _goMessages(context);
            },
            child: Text('${messagesRepository.newMessage} yeni mesaj'),
          ),
          TextButton(
              onPressed: () {
                _goStudents(context);
              },
              child: Text('${studentRepository.students.length} Öğrenci')),
          TextButton(
              onPressed: () {
                _goTeachers(context);
              },
              child: Text('${teacherRepository.teachers.length} Öğretmen'))
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Text('Öğrenci Adı'),
            ),
            ListTile(
              title: Text('Öğrenciler'),
              onTap: () {
                _goStudents(context);
              },
            ),
            ListTile(
              title: Text('Öğretmenler'),
              onTap: () {
                _goTeachers(context);
              },
            ),
            ListTile(
              title: Text('Mesajlar'),
              onTap: () {
                _goMessages(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _goStudents(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return StudentsPage(studentRepository);
      },
    ));
  }

  void _goTeachers(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return TeachersPage(teacherRepository);
      },
    ));
  }

  Future<void> _goMessages(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return MessagePage(messagesRepository);
      },
    ));
    setState(() {
    });
  }
}
