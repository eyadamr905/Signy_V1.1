import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  final videoURL = "https://youtu.be/hr5UlJbII_s?si=vWUdnLK_BIU3t8qZ";
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
        title: const Text('food Video'),
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