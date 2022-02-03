import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:rxdart/rxdart.dart';


class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

class PlayScreen extends StatefulWidget {
  final Song song;
  
  PlayScreen({Key? key, required this.song}) : super(key: key);
  
  @override
  _PlayScreenState createState() => _PlayScreenState();
}



class _PlayScreenState extends State<PlayScreen> with WidgetsBindingObserver {
  IconData playBtn = Icons.play_arrow;
  bool isPlaying = false;
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final AudioPlayer _player = AudioPlayer();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _init();
  }
  void seek(Duration position) {
    _player.seek(position);
  }
  Future<void> _init() async {
    print(widget.song.path);
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
        widget.song.path)));
    } catch (e) {
      print("Error loading audio source: $e");
    }
    _player.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
    _player.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
    _player.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }


  @override
  PlayScreen get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(       
        backgroundColor: const Color(0xFF222222),
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
            backgroundColor: Color(0xFF222222),
            title: Text("Now Playing",
                style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
            elevation: 0,
          ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15.0, 
              ),
              Card(
                child: Image.asset("assets/images/adele25.jpg", height: 300.0),
                elevation: 10.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                widget.song.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(
                height: 10.0, 
              ),
              Text(
                widget.song.artist,
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ValueListenableBuilder<ProgressBarState>(
                  valueListenable: progressNotifier,
                  builder: (_, value, __) {
                    return ProgressBar(
                      progress: value.current,
                      buffered: value.buffered,
                      total: value.total,
                      onSeek: seek,
                      baseBarColor: Colors.white,
                      progressBarColor: Color(0xFFE5BE58),
                      thumbRadius: 5,
                      thumbColor: Color(0xFFE5BE58),
                      bufferedBarColor: Colors.grey,
                    );
                  },
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 45.0,
                    color: Colors.white,
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.skip_previous
                    )
                  ),
                  IconButton(
                    iconSize: 52.0,
                    color: Colors.white,
                    onPressed: () {
                      if (!isPlaying) {
                        setState(() {
                          _player.play();
                          playBtn = Icons.pause;
                          isPlaying = true;
                        });
                      } else {
                        setState(() {
                          _player.pause();
                          playBtn = Icons.play_arrow;
                          isPlaying = false;
                        });
                      }
                    }, 
                    icon: Icon(
                      playBtn,
                    )
                  ),
                  IconButton(
                    iconSize: 45.0,
                    color: Colors.white,
                    onPressed: () {}, 
                    icon: const Icon(
                      Icons.skip_next
                    )
                  ),
                ]
              ,)
            ],
          )
        ),
    );
  }
}