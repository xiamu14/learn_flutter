import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayer extends StatefulWidget {
  //https://nico-android-apk.oss-cn-beijing.aliyuncs.com/landscape.mp4
  final String playUrl;

  ChewiePlayer(this.playUrl);
  @override
  _ChewiePlayerState createState() => _ChewiePlayerState();
}

class _ChewiePlayerState extends State<ChewiePlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.playUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      //aspectRatio: 3 / 2.0,
      //customControls: CustomControls(),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
