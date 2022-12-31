// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class TrailerModel extends StatefulWidget {
//   const TrailerModel({super.key});

//   @override
//   State<TrailerModel> createState() => _TrailerModelState();
// }

// class _TrailerModelState extends State<TrailerModel> {
//   final videoURL = "https://www.youtube.com/watch?v=DN3sRz_veBU";
  
//   late YoutubePlayerController _controller;
//   @override
//   void initState() {
//     final videoID = YoutubePlayer.convertUrlToId(videoURL);


//     _controller = YoutubePlayerController(
//     initialVideoId: videoID!,
//     flags : const YoutubePlayerFlags(
//       autoPlay: false
//     ),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Trailer")),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           YoutubePlayer(
//             controller: _controller,
//             showVideoProgressIndicator: true,
//             ),
//         ],
//       ),
//     );
//   }
// }
