import 'package:basic_student_app/repository/students_repository.dart';
import "package:flutter/material.dart";

class StudentsPage extends StatefulWidget {
  final StudentRepository studentRepository;

  StudentsPage(this.studentRepository, {Key? key}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Öğrenciler")),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.black12,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 32.0),
                child:
                    Text('${widget.studentRepository.students.length} öğrenci'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => StudentRow(
                      widget.studentRepository.students[index],
                      widget.studentRepository,
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: widget.studentRepository.students.length),
          ),
        ],
      ),
    );
  }
}

class StudentRow extends StatefulWidget {
  final Student student;
  final StudentRepository studentRepository;

  const StudentRow(
    this.student,
    this.studentRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<StudentRow> createState() => _StudentRowState();
}

class _StudentRowState extends State<StudentRow> {
  @override
  Widget build(BuildContext context) {
    bool amILike = widget.studentRepository.amILike(widget.student);
    return ListTile(
      title: Text(widget.student.name + ' ' + widget.student.surname),
      leading: IntrinsicWidth(
          child: Center(
              child: Text(widget.student.gender == 'Kız' ? '👧' : '👦'))),
      //👧🏼👦🏼
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.studentRepository.like(widget.student, !amILike);
          });
        },
        icon: Icon(amILike ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
