import 'dart:async';
import 'dart:js';
import 'package:video_js/src/models/result_from_videoJs.dart';

class VideoJsResults {
  StreamController<ResultFromVideoJs> _onVolumeFromJsStream =
      StreamController<ResultFromVideoJs>.broadcast();

  StreamController<ResultFromVideoJs> get onVolumeFromJsStream =>
      _onVolumeFromJsStream;

  VideoJsResults._privateConstructor();

  static final VideoJsResults _instance = VideoJsResults._privateConstructor();

  factory VideoJsResults() {
    return _instance;
  }

  /// this function need to call on app's main method to register call back's from javascript side
  init() {
    context['callBackToDartSide'] = (playerId, type, value) {
      _onVolumeFromJsStream.sink.add(ResultFromVideoJs(
          playerId.toString(), type.toString(), value.toString()));
    };
  }

  /// this function listening to every call back from javascript type
  /// type can be onReady, onEnd, getVolume, isMute, isFull, isPaused, getCurrent, getDuration,
  /// getRemaining, getBuffered, getPoster, onReady
  listenToValueFromJs(
      String playerId, String type, Function(String) onJsValue) {
    StreamSubscription? subscription;
    subscription = VideoJsResults()
        .onVolumeFromJsStream
        .stream
        .listen((ResultFromVideoJs resulteFromVideoJs) {
      if (playerId == resulteFromVideoJs.videoId &&
          type == resulteFromVideoJs.type) {
        onJsValue(resulteFromVideoJs.result);
        subscription!.cancel();
      }
    });
  }

  /// close StreamController
  close() {
    _onVolumeFromJsStream.close();
  }
}
