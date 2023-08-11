import 'package:audioplayers/audioplayers.dart';
import 'package:clock_app/features/view/voice/voices_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

mixin VoicesOperationMixin on State<VoicesView> {
  late List<Song> songs = [];
  AudioPlayer audioPlayer = AudioPlayer();
  Song? playingSong;

  @override
  void initState() {
    super.initState();
    loadMusicData();
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.completed) {
        setState(() {
          playingSong = null;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> loadMusicData() async {
    final jsonString = await rootBundle.loadString('assets/json/voice.json');
    final List<dynamic> jsonList = convert.jsonDecode(jsonString);
    songs = jsonList
        .map((item) => Song(
            title: item['name'], asset: item['path'], image: item['imagePath']))
        .toList();
    setState(() {});
  }

  void playSong(Song song) async {
    if (playingSong == song) {
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.resume();
      }
    } else {
      if (playingSong != null) {
        await audioPlayer.stop();
      }
      String prefix = "assets/";
      String pathResult = song.asset;
      if (song.asset.startsWith(prefix)) {
        pathResult = song.asset.substring(prefix.length);
      } else {}

      await audioPlayer.play(AssetSource(pathResult));
      audioPlayer.setReleaseMode(ReleaseMode.loop);

      setState(() {
        playingSong = song;
      });
    }
  }
}
