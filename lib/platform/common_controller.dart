import 'package:video_js/video_js.dart';

class VideoJsController {
  final String playerId;
  final VideoJsOptions? videoJsOptions;

  VideoJsController(this.playerId, {this.videoJsOptions});
  play() {}
  init() {}
  isPaused(Function(String) onPauseStatus) {}
  durationTime(Function(String) onDurationTime) {}
}
