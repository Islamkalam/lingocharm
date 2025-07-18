import 'package:flutter/material.dart';
import 'package:lingocharm/widgets/voicewavebutton.dart';

class VoiceMatch extends StatefulWidget {
  const VoiceMatch({super.key});

  @override
  State<VoiceMatch> createState() => _VoiceMatchState();
}

class _VoiceMatchState extends State<VoiceMatch> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height - MediaQuery.of(context).padding.top,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Container(
                //   height: size.height * 0.09,
                //   width: size.width * 0.4,
                //   decoration: BoxDecoration(
                //     color: Colors.amberS
                //   ),
                // ),
                VoiceWaveButton(text: "Hello"),
                // Container(
                //   height: size.height * 0.09,
                //   width: size.width * 0.4,
                //   decoration: BoxDecoration(
                //     color: Colors.amber
                //   ),
                // )
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
