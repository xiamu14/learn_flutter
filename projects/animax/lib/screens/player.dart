import 'package:animax/screens/home.dart';
import 'package:animax/utils/format_duration.dart';
import 'package:anime_api/api/anime.dart';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class AnimePlayer extends StatefulWidget {
  const AnimePlayer({Key? key, required this.animeId, required this.index})
      : super(key: key);

  final String animeId;
  final String index;

  static String routePath = '/animePlayer';

  @override
  State<AnimePlayer> createState() => _AnimePlayerState();
}

class _AnimePlayerState extends State<AnimePlayer> {
  late VideoPlayerController _controller;
  Future<void>? _initializeVideoPlayerFuture;
  bool _isFullScreen = false;
  bool _isControlBarVisible = true;
  String _videoPosition = '00:00';
  String title = ''; // 视频播放位置显示

  void _videoListener() async {
    if (!_controller.value.hasError) {
      Duration? res = await _controller.position;
      if (res != null) {
        if (res >= _controller.value.duration) {
          await _controller.seekTo(const Duration(seconds: 0));
          await _controller.pause();
        }
        if (_controller.value.isPlaying) {
          /// 减少build次数
          setState(() {
            _videoPosition = FormatDuration.hourAndMinute(res);
          });
        }
      }
    }
  }

  @override
  void initState() {
    AnimeApi.getAnimeById(int.parse(widget.animeId)).then((anime) {
      if (anime.episodes.isNotEmpty) {
        final episode = anime.episodes
            .firstWhere((element) => element.index == int.parse(widget.index));
        _controller = VideoPlayerController.network(
          episode.videoUrl,
        )..addListener(_videoListener);

        _initializeVideoPlayerFuture = _controller.initialize();
      }
      title = '${anime.name} - ${widget.index}';
      setState(() {});
    });

    super.initState();

    ///关闭状态栏，与底部虚拟操作按钮
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    print(_initializeVideoPlayerFuture);
    if (_initializeVideoPlayerFuture == null) {
      return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                // backgroundColor: Colors.transparent,
                color: Theme.of(context).primaryColor,
              )),
        ),
      );
    }
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isControlBarVisible = !_isControlBarVisible;
          });
        },
        child: Container(
          decoration: const BoxDecoration(color: Colors.black87),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return buildFullScreen(
                      context,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      ),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: SafeArea(
                    left: false,
                    right: false,
                    top: _isFullScreen ? false : true,
                    child: AnimatedOpacity(
                      opacity: _isControlBarVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        width: sw,
                        height: _isFullScreen ? 60 : 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.red),
                          gradient: _isFullScreen
                              ? const LinearGradient(
                                  colors: [
                                      Colors.black54,
                                      Colors.transparent,
                                    ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              : const LinearGradient(colors: [
                                  Colors.transparent,
                                  Colors.transparent
                                ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (GoRouter.of(context).canPop()) {
                                  GoRouter.of(context).pop();
                                } else {
                                  GoRouter.of(context).go(Home.routePath);
                                }
                              },
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                child: SafeArea(
                  left: false,
                  right: false,
                  bottom: _isFullScreen ? false : true,
                  child: AnimatedOpacity(
                    opacity: _isControlBarVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      width: sw,
                      height: _isFullScreen ? 60 : 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red),
                        gradient: _isFullScreen
                            ? const LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            : const LinearGradient(colors: [
                                Colors.transparent,
                                Colors.transparent
                              ]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                // If the video is playing, pause it.
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller.play();
                                  setState(() {
                                    _isControlBarVisible = false;
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            _videoPosition,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            // width: sw,
                            child: VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              padding: const EdgeInsets.only(
                                  top: 0), // remove default top padding
                              colors: VideoProgressColors(
                                backgroundColor: Colors.white.withOpacity(0.2),
                                bufferedColor: Colors.white.withOpacity(0.4),
                                playedColor: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            FormatDuration.hourAndMinute(
                                _controller.value.duration),
                            style: const TextStyle(color: Colors.white),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isFullScreen = !_isFullScreen;
                                });
                                AutoOrientation.landscapeAutoMode();
                              },
                              icon: Icon(
                                _isFullScreen
                                    ? Icons.fullscreen
                                    : Icons.fullscreen_exit,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFullScreen(
    BuildContext context, {
    required Widget child,
  }) {
    double aspectRatio = _controller.value.aspectRatio;
    final sw = MediaQuery.of(context).size.width;
    final videoBoxHeight = sw / aspectRatio;

    return FittedBox(
      fit: _isFullScreen ? BoxFit.cover : BoxFit.contain,
      child: SizedBox(width: sw, height: videoBoxHeight, child: child),
    );
  }
}
