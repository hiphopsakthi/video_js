library video_js;

export 'package:video_js/src/video_js_widget.dart';
export 'package:video_js/src/models/videoJs_options.dart';
export 'package:video_js/src/models/source.dart';
export 'package:video_js/platform/common_controller.dart'
    if (dart.library.html) 'package:video_js/src/web/video_js_controller.dart';
export 'package:video_js/src/models/result_from_videoJs.dart';
export 'package:video_js/platform/common_result.dart'
    if (dart.library.html) 'package:video_js/src/web/video_results.dart';
