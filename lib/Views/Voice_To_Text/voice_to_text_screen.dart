import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceTOTextScreen extends StatefulWidget {
  const VoiceTOTextScreen({Key? key}) : super(key: key);

  @override
  State<VoiceTOTextScreen> createState() => _VoiceTOTextScreenState();
}

class _VoiceTOTextScreenState extends State<VoiceTOTextScreen> {
  stt.SpeechToText? _speechToText;
  bool _speechEnabled = false;
  String _lastWords = 'press the Button to start Specking';

  Future<void> onListen() async {
    if (!_speechEnabled) {
      bool available = await _speechToText!.initialize(onStatus: (val) {
        print("onStatus $val");
      }, onError: (val) {
        print("onError $val");
      });
      if (available) {
        setState(() {
          _speechEnabled = true;
        });
        _speechToText!.listen(onResult: (val) {
          setState(() {
            _lastWords = val.recognizedWords;
          });
        });
      } else {
        setState(() {
          _speechEnabled = false;
          _speechToText!.stop();
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speechToText = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Speech To Text")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _lastWords,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _speechEnabled,
        glowColor: Colors.blue,
        endRadius: 90.0,
        duration: const Duration(milliseconds: 2000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        child: FloatingActionButton(
          onPressed: () {
            onListen();
          },
          child: Icon(_speechEnabled ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }
}
