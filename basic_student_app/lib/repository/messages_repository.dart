class MessagesRepository{
  List<Message> messages = [
    Message("Merhaba", "Ali", DateTime.now().subtract(const Duration(minutes: 3))),
    Message("Orada mısın?", "Ali", DateTime.now().subtract(const Duration(minutes: 2))),
    Message("Evet", "Ayşe", DateTime.now().subtract(const Duration(minutes: 1))),
    Message("Nasılsın", "Ayşe", DateTime.now()),
  ];

  int newMessage = 14;
}

class Message{
  String message;
  String sender;
  DateTime  time;
  
  Message(this.message, this.sender, this.time);
}