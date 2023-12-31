class Message {
  Message({
    required this.toID,
    required this.msg,
    required this.read,
    required this.type,
    required this.send,
    required this.fromID,
  });
  late final String toID;
  late final String msg;
  late final String read;
  late final String send;
  late final String fromID;
  late final Type type;

  Message.fromJson(Map<String, dynamic> json) {
    toID = json['toID'].toString();
    msg = json['msg'].toString();
    read = json['read'].toString();
    send = json['send'].toString();
    fromID = json['fromID'].toString();
    type = json['type'].toString() == Type.image.name ? Type.image : Type.text;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['toID'] = toID;
    data['msg'] = msg;
    data['read'] = read;
    data['type'] = type.name;
    data['send'] = send;
    data['fromID'] = fromID;
    return data;
  }
}

enum Type { text, image }
