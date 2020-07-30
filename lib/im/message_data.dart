enum MessageType {SYSTEM, PUBLIC, CHAT, GROUP}

class MessageData {
  String avatar;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

List<MessageData> messageData = [
  MessageData('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=416111731,3919172424&fm=26&gp=0.jpg',
      '八戒',
      '突然想到',
      DateTime.now(),
      MessageType.CHAT),
  MessageData('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=416111731,3919172424&fm=26&gp=0.jpg',
      '八戒',
      '突然想到',
      DateTime.now(),
      MessageType.CHAT),
  MessageData('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=416111731,3919172424&fm=26&gp=0.jpg',
      '八戒',
      '突然想到',
      DateTime.now(),
      MessageType.CHAT),
];