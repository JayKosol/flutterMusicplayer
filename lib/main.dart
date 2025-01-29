import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fuctest/page/home_page.dart';
import 'package:fuctest/themes/darkmode.dart';
import 'package:fuctest/themes/lightmode.dart';
import 'package:fuctest/themes/themesprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemesProvider(),
      child: const MyApp(),
    )
  );
}
class MusicPlayerState with ChangeNotifier{
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  void togglePlayback(String audioUrl){
    if(_isPlaying){
      _audioPlayer.pause();
    }
    else{
      _audioPlayer.play(UrlSource(audioUrl));
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MusicPlayerState(),
      child: MaterialApp(
        title: "MusicPlayer App",
        home: HomePage(),
        theme: Provider.of<ThemesProvider>(context).themeData,
      ),
    );
  }
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final musicPlayerState = Provider.of<MusicPlayerState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Now Playing: Song Title'),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: (){
                musicPlayerState.togglePlayback('https://www.sample-videos.com/audio/mp3/wave.mp3');
              },
              child: musicPlayerState._isPlaying
                ? Icon(Icons.pause):Icon(Icons.play_arrow)
            )
          ],
        ),
      ),
    );
  }
}


