import 'package:flutter/material.dart';
import 'package:lingocharm/global/app_colors.dart';
import 'dart:math';

import 'package:lingocharm/widgets/tts_widget.dart';

class VoiceWaveButton extends StatefulWidget {
  final String text;
  const VoiceWaveButton({super.key, required this.text});

  @override
  State<VoiceWaveButton> createState() => _VoiceWaveButtonState();
}

class _VoiceWaveButtonState extends State<VoiceWaveButton> {
  final Random _random = Random();

  List<Widget> _buildWaveform(double maxWidth) {
    const barWidth = 3.0;
    const spacing = 2.0;
    final totalBarSpace = barWidth + spacing;
    final barCount = (maxWidth / totalBarSpace).floor();

    return List.generate(barCount, (_) {
      final height = _random.nextInt(14) + 6.0; // between 6 and 20
      return _bar(height, barWidth);
    });
  }

  Widget _bar(double height, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.waveformBar,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double buttonWidth = size.width * 0.4;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 48,
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              TTSWidget(text: widget.text);
              print("Text to speak: ${widget.text}");
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12),
              backgroundColor: AppColors.buttonColor,
            ),
            child: Row(
              children: [
                const Icon(Icons.volume_up),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: _buildWaveform(buttonWidth * 0.6),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
