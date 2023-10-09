import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:video_js/video_js.dart';

class VideoJsWidget extends StatelessWidget {
  final VideoJsController videoJsController;
  final double height;
  final double width;

  const VideoJsWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.videoJsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: kIsWeb
          ? HtmlElementView(
              viewType: 'fdRDfg3',
            )
          : Center(
              child: Text("Video_js plugin just supported on web"),
            ),
    );
  }
}
