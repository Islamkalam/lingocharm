// import 'package:flutter/material.dart';
// import 'package:lingocharm/global/app_globals.dart';
// import 'package:lingocharm/widgets/tts_widget.dart';
// import 'package:lingocharm/services/stt_service.dart';

// class PracticeScreen extends StatefulWidget {
//   const PracticeScreen({super.key});

//   @override
//   State<PracticeScreen> createState() => _PracticeScreenState();
// }

// class _PracticeScreenState extends State<PracticeScreen> {
//   final String targetSentence = "This is a sample sentence";
//   String spokenText = "";
//   List<String> userWords = [];

//   void _onSpeechResult(String text) {
//     setState(() {
//       spokenText = text;
//       userWords = text.split(" ");
//     });

//     if (_isSentenceCorrect()) {
//       _showCompletionDialog();
//     }
//   }

//   bool _isSentenceCorrect() {
//     List<String> targetWords = targetSentence.split(" ");
//     if (userWords.length != targetWords.length) return false;

//     for (int i = 0; i < targetWords.length; i++) {
//       if (userWords[i].toLowerCase() != targetWords[i].toLowerCase()) {
//         return false;
//       }
//     }
//     return true;
//   }

//   void _showCompletionDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder:
//           (context) => AlertDialog(
//             title: const Text("Great Job!"),
//             content: const Text("You completed the level correctly."),
//             actions: [
//               TextButton(
//                 onPressed:
//                     () => Navigator.of(
//                       context,
//                     ).popUntil((route) => route.isFirst),
//                 child: const Text("Home"),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text("Try Again"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   // Navigate to next screen or reset state here
//                 },
//                 child: const Text("Next"),
//               ),
//             ],
//           ),
//     );
//   }

//   Future<void> _startListening() async {
//     final result = await STTService.listen();
//     _onSpeechResult(result);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: AppGlobals.backgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset(
//                     'assets/images/star.png',
//                     width: size.width * 0.1,
//                   ),
//                   TTSWidget(text: targetSentence),
//                 ],
//               ),
//               const SizedBox(height: 32),
//               Expanded(
//                 child: Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
//                   children: _buildTextLine(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _startListening,
//                 child: const Text("Start Speaking"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildTextLine() {
//     final targetWords = targetSentence.split(" ");
//     return List.generate(targetWords.length, (index) {
//       final word = targetWords[index];
//       Color color = Colors.grey.shade300;

//       if (index < userWords.length) {
//         if (userWords[index].toLowerCase() == word.toLowerCase()) {
//           color = Colors.green;
//         } else {
//           color = Colors.red;
//         }
//       }

//       return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(word, style: const TextStyle(fontSize: 18)),
//       );
//     });
//   }
// }
