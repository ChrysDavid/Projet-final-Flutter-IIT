import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/screens/bottomNavigationBar/Chat/chat_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jj_vr/screens/bottomNavigationBar/Chat/components/body.dart';

class MessagesScreen extends StatefulWidget {
  final Chat chat;

  const MessagesScreen({Key? key, required this.chat}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];
  bool _isComposing = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _messages.add(
          ChatMessage(
            messageContent: _textController.text,
            messageTime: DateTime.now().toString(),
            messageType: ChatMessageType.text,
            messageStatus: MessageStatus.not_sent,
            isSender: true,
          ),
        );
        _textController.clear();
        _isComposing = false;
      });
    }
  }

  Future<void> _sendImageMessage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _messages.add(
          ChatMessage(
            messageContent: pickedFile.path,
            messageTime: DateTime.now().toString(),
            messageType: ChatMessageType.image,
            messageStatus: MessageStatus.not_sent,
            isSender: true,
          ),
        );
        _isComposing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.chat.image),
            ),
            SizedBox(width: kDefaultPadding * 0.75),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Active 3m ago",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                itemCount: widget.chat.messages.length + _messages.length,
                itemBuilder: (context, index) {
                  if (index < widget.chat.messages.length) {
                    return Message(
                      message: widget.chat.messages[index],
                      chat: widget.chat,
                    );
                  } else {
                    final messageIndex = index - widget.chat.messages.length;
                    final message = _messages[messageIndex];
                    return Message(message: message, chat: widget.chat);
                  }
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                          onPressed: () {
                            // Action à effectuer lors du clic sur l'icône des émoticônes
                          },
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            onChanged: (text) {
                              setState(() {
                                _isComposing = text.isNotEmpty;
                              });
                            },
                            maxLines: null,
                            minLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Type a message",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!
                                    .withOpacity(0.64),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !_isComposing,
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                            onPressed: _sendImageMessage,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.attach_file,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                          onPressed: () {
                            // Action à effectuer lors du clic sur l'icône de trombone
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                IconButton(
                  icon: Icon(
                    _textController.text.isNotEmpty ? Icons.send : Icons.mic,
                    color: _textController.text.isNotEmpty
                        ? kPrimaryColor
                        : Colors.grey,
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
