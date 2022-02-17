class StudentRepository {
  final students = [
    Student("Zeynep Birgül", "Turkut", 18, "Kız"),
    Student("Ahmed Furkan Kağan", "Turkut", 14, "Erkek"),
    Student("Gamze İkra", "Filiz", 12, "Kız"),
    Student("Ebrar Tuğçe", "Turkut", 17, "Kız"),
    Student("Galip", "Karapunar", 15, "Erkek"),
  ];

  final Set<Student> mylikes = {};

  void like(Student student, bool amILike) {
    if (amILike) {
      mylikes.add(student);
    } else {
      mylikes.remove(student);
    }
  }

  bool amILike(Student student) {
    return mylikes.contains(student);
  }
}

class Student {
  String name;
  String surname;
  int age;
  String gender;

  Student(this.name, this.surname, this.age, this.gender);
}
