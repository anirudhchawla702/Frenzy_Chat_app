import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  static const String _name = "Anirudh";

  final String text;

  ChatMessage({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: const EdgeInsets.only(
              right: 16,
            ),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              new Container(
                margin: EdgeInsets.only(
                  top: 5,
                ),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
