import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon((playing) ? Icons.pause : Icons.play_arrow),
              iconSize: 64.0,
              onPressed: () async {

                try {
                  await player.setUrl("http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_q");
                } catch(e){
                  print ('======>>>>>>> ERROR : $e');
                }

                (playing) ? player.pause() : player.play();
                setState(() {
                  playing = !playing;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
