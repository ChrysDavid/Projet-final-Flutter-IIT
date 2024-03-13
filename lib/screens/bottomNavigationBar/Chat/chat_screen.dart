import 'package:flutter/material.dart';
import 'package:jj_vr/components/coustom_bottom_nav_bar.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/enums.dart';
import 'package:jj_vr/screens/bottomNavigationBar/Chat/components/Message_screen.dart';
import 'package:jj_vr/screens/bottomNavigationBar/Chat/components/body.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/message";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Chat> chatsData = [
    Chat(
      name: "Mon Entreprise",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/download-3.png",
      time: "3m ago",
      isActive: false,
      messages: [
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "Hello! How are you?",
          messageTime: "10:00 AM",
          isSender: false,
          messageStatus: MessageStatus.viewed,
        ),
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "I'm good. Thanks for asking!",
          messageTime: "10:02 AM",
          isSender: true,
          messageStatus: MessageStatus.viewed,
        ),
      ],
    ),
    Chat(
      name: "Mon Entreprise",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/user.png",
      time: "3m ago",
      isActive: false,
      messages: [
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "Welcome to our company!",
          messageTime: "11:00 AM",
          isSender: false,
          messageStatus: MessageStatus.viewed,
        ),
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "Thank you. I'm excited to be here!",
          messageTime: "11:02 AM",
          isSender: true,
          messageStatus: MessageStatus.viewed,
        ),
      ],
    ),
    Chat(
      name: "Mon Entreprise",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/profile3.png",
      time: "3m ago",
      isActive: false,
      messages: [
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "Welcome to our company!",
          messageTime: "11:00 AM",
          isSender: false,
          messageStatus: MessageStatus.viewed,
        ),
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "Thank you. I'm excited to be here!",
          messageTime: "11:02 AM",
          isSender: true,
          messageStatus: MessageStatus.viewed,
        ),
      ],
    ),
  ];

  List<Chat> _selectedChats = [];

  void _selectChat(Chat chat) {
    setState(() {
      if (_selectedChats.contains(chat)) {
        _selectedChats.remove(chat);
      } else {
        _selectedChats.add(chat);
      }
    });
  }

  void _deleteSelectedChats() {
    setState(() {
      chatsData.removeWhere((chat) => _selectedChats.contains(chat));
      _selectedChats.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildChatList() {
      if (chatsData.isEmpty) {
        return Center(
          child: Text(
            "Vous n'avez aucune conversation.",
            style: TextStyle(fontSize: 16),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: chatsData.length,
          itemBuilder: (context, index) {
            final chat = chatsData[index];
            final isSelected = _selectedChats.contains(chat);
            return LongPressSelectionDetector(
              child: ChatCard(
                chat: chat,
                press: () {
                  if (_selectedChats.isNotEmpty) {
                    _selectChat(chat);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagesScreen(chat: chat),
                      ),
                    );
                  }
                },
                isSelected: isSelected,
              ),
              onLongPress: () {
                _selectChat(chat);
              },
            );
          },
        );
      }
    }

    bool isSelectingMode = _selectedChats.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: isSelectingMode
            ? Text('${_selectedChats.length} sélectionné(s)')
            : Text('Chats'),
        automaticallyImplyLeading: !isSelectingMode,
        actions: isSelectingMode
            ? [
                IconButton(
                  onPressed: _deleteSelectedChats,
                  icon: Icon(Icons.delete),
                ),
              ]
            : [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_outlined),
                )
              ],
      ),
      body: buildChatList(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}

class Chat {
  final String name;
  final String lastMessage;
  final String image;
  final String time;
  final bool isActive;
  final List<ChatMessage> messages;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    this.isActive = false,
    required this.messages,
  });
}

class ChatMessage {
  final String messageContent;
  final String messageTime;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.messageContent,
    required this.messageTime,
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        color: isSelected ? Colors.red.withOpacity(0.2) : null,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 0.75,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(chat.image),
            ),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      chat.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(
                chat.time,
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LongPressSelectionDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onLongPress;

  const LongPressSelectionDetector({
    Key? key,
    required this.child,
    required this.onLongPress,
  }) : super(key: key);

  @override
  _LongPressSelectionDetectorState createState() =>
      _LongPressSelectionDetectorState();
}

class _LongPressSelectionDetectorState
    extends State<LongPressSelectionDetector> {
  bool _isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isLongPressed = true;
        });
        widget.onLongPress();
      },
      onTap: () {
        if (_isLongPressed) {
          setState(() {
            _isLongPressed = false;
          });
        } else {
          // Handle normal tap action
        }
      },
      child: widget.child,
    );
  }
}
