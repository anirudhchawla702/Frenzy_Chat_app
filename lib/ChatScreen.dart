import 'package:flutter/material.dart';

import './ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposeWidget() {
    return IconTheme(
      data: new IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: new Row(
          children: [
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                  hintText: "Send a message",
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: new IconButton(
                icon: new Icon(
                  Icons.send,
                ),
                onPressed: () => _handleSubmitted(
                  _textController.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(
              8,
            ),
            itemBuilder: (_, int index) => _messages[index],
            reverse: true,
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposeWidget(),
        ),
      ],
    );
  }
}
