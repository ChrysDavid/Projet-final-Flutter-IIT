import 'package:flutter/material.dart';
import 'package:jj_vr/constants.dart';
import 'package:jj_vr/screens/bottomNavigationBar/Chat/chat_screen.dart';

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class TextMessage extends StatelessWidget {
  final ChatMessage message;

  const TextMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color:
              message.isSender ? kPrimaryColor : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          message.messageContent,
          style: TextStyle(
            color: message.isSender ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

// Autres widgets pour afficher les types de messages audio, image et vidéo...

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;

  const MessageStatusDot({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

class Message extends StatelessWidget {
  final ChatMessage message;
  final Chat chat;

  Message({Key? key, required this.message, required this.chat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        case ChatMessageType.image:
          return ImageMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage(message: message);
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage:
                  AssetImage(message.isSender ? chat.image : chat.image),
            ),
            SizedBox(width: kDefaultPadding / 2),
          ],
          messageContent(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
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

class AudioMessage extends StatelessWidget {
  final ChatMessage message;

  const AudioMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: message.isSender ? kPrimaryColor : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(
            Icons.volume_up,
            color: message.isSender ? Colors.white : Colors.black,
          ),
          SizedBox(width: kDefaultPadding / 2),
          Expanded(
            child: Container(
              height: 2,
              color: message.isSender ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
          Text(
            '0:30',
            style: TextStyle(
              color: message.isSender ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  final ChatMessage message;

  const ImageMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/image.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class VideoMessage extends StatelessWidget {
  final ChatMessage message;

  const VideoMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/video_thumb.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Icon(
        Icons.play_circle_fill,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
