class TeacherRepository {
  List<Teacher> teachers = [

    Teacher("Fatma Betül", "Sofuoğlu", 23, "Kız"),
    Teacher("Zeynep Birgül", "Turkut", 18, "Kız"),
    Teacher("Ebrar Tuğçe", "Turkut", 17, "Kız"),
  ];

}

class Teacher {
  String name;
  String surname;
  int age;
  String gender;

  Teacher(this.name, this.surname, this.age, this.gender);
}