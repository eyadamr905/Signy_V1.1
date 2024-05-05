import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({Key? key}) : super(key: key);

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  final videoURL = "https://youtu.be/mxHICfk1Hj0?si=FKHrQX5z8aVTeSqc";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
          enableCaption: false,
          showLiveFullscreenButton: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet Video'),
      ),
      body: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Ready'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              const PlaybackSpeedButton(),
              FullScreenButton(),
            ],
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                player,
                
              ],
            );
          },
        ),
      ),
    );
  }
}