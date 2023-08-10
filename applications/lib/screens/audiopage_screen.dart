import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudiopageScreen extends StatefulWidget {
  const AudiopageScreen({super.key});

  @override
  State<AudiopageScreen> createState() => _AudiopageScreenState.onPlayerStateChanged();
}

class _AudiopageScreenState extends State<AudiopageScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
PlayerState _playerState = PlayerState.stopped;

void _onPlayerStateChanged(PlayerState state) {
  setState(() {
    _playerState = state;
  });
}

audioPlayer.onPlayerStateChanged.listen((event) {
  _onPlayerStateChanged(event);
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Audio Player'),
            IconButton(
              icon: _playerState == PlayerState.playing
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
              onPressed: () {
                if (_playerState == PlayerState.playing) {
                  audioPlayer.pause();
                } else {
                  audioPlayer.play('assets/sound/mockingbird-lyrics.mp3');
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                audioPlayer.stop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
