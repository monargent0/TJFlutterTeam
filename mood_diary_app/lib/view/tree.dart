import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class TreeWgt extends StatefulWidget {
  final int treeGrowth;
  final String weather;
  const TreeWgt(
      {Key? key,
      required this.weather,
      required this.treeGrowth})
      : super(key: key);

  @override
  State<TreeWgt> createState() => _TreeWgtState();
}

class _TreeWgtState extends State<TreeWgt> {
  late VideoPlayerController _vController;

  @override
  void initState() {
    _vController = VideoPlayerController.asset(
      'assets/tree.mp4',
    );
    _vController.initialize().then((_) {
      setState(() {
        _vController
            .seekTo(Duration(milliseconds: min(2800, widget.treeGrowth * 25)));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _vController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('도토리 마을'),
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.brown,
        elevation: 0,
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: _vController.value.aspectRatio,
                child: VideoPlayer(_vController),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 280,
                  ),
                  Lottie.asset('assets/${widget.weather}.json', width: 120),
                ],
              ),
              widget.weather == 'sunny'
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 230,
                        ),
                        Lottie.asset('assets/squirrels.json', width: 120),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                          onTap: (){
                            //
                          },
                          child: Lottie.asset('assets/${widget.weather}.json', width: 120)),
                      ],
                    ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
