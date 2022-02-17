import 'package:basic_student_app/repository/teachers_repository.dart';
import "package:flutter/material.dart";

class TeachersPage extends StatefulWidget {
  final TeacherRepository teacherRepository;

  TeachersPage(this.teacherRepository, {Key? key}) : super(key: key);

  @override
  _TeachersPageState createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Öğretmenler")),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.black12,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 32.0),
                child: Text(
                    '${widget.teacherRepository.teachers.length} Öğretmen'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => TeacherRow(
                      widget.teacherRepository.teachers[index],
                      widget.teacherRepository,
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: widget.teacherRepository.teachers.length),
          ),
        ],
      ),
    );
  }
}

class TeacherRow extends StatefulWidget {
  final Teacher teacher;
  final TeacherRepository teacherRepository;

  const TeacherRow(
    this.teacher,
    this.teacherRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<TeacherRow> createState() => _TeacherRowState();
}

class _TeacherRowState extends State<TeacherRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.teacher.name + ' ' + widget.teacher.surname),
      leading: IntrinsicWidth(
          child: Center(
              child: Text(widget.teacher.gender == 'Kız' ? '👧' : '👦'))), //👧🏼👦🏼 👧👦
    );
  }
}
