import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Model/chat_user_model.dart';

class ServicesApi {
  //TODO: authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  //TODO: get authentication uid
  static User get user => auth.currentUser!;
//TODO: get fireStore uid
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  // static FirebaseStorage storage = FirebaseStorage.instance;

//TODO: for checking if user exists or not?
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

//TODO: for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        id: user.uid,
        name: user.displayName.toString(),
        email: user.email.toString(),
        about: "Hey, I'm using We Chat!",
        image: user.photoURL.toString(),
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken: '');

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }

//TODO: Profile Data
  static ChatUser profile = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "Hey, I'm using We Chat!",
      image: user.photoURL.toString(),
      createdAt: '',
      isOnline: false,
      lastActive: '',
      pushToken: '');
}
