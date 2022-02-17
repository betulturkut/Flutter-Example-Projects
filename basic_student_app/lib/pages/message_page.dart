import 'dart:math';

import 'package:basic_student_app/repository/messages_repository.dart';
import "package:flutter/material.dart";

class MessagePage extends StatefulWidget {
  final MessagesRepository messagesRepository;

  MessagePage(this.messagesRepository, {Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    widget.messagesRepository.newMessage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Mesajlaşma')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: widget.messagesRepository.messages.length,
                itemBuilder: (context, index) {
                  return MessageView(widget.messagesRepository.messages[
                      widget.messagesRepository.messages.length - index - 1]);
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print('Gönder');
                        },
                        child: const Text('Gönder')),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MessageView extends StatelessWidget {
  final Message message;

  const MessageView(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: message.sender == 'Ali'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(message.message),
            ),
          ),
        ));
  }
}
