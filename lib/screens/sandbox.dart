// import 'package:flutter/material.dart';
//
// class Sandbox extends StatefulWidget {
//   const Sandbox({super.key});
//
//   @override
//   State<Sandbox> createState() => _SandboxState();
// }
//
// class _SandboxState extends State<Sandbox> {
//   double margin = 0;
//   double opacity = 1;
//   double width = 200;
//   Color color = Colors.blue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//         margin: EdgeInsets.all(margin),
//         width: width,
//         color: color,
//         duration: const Duration(seconds: 1),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               child: Text('Animate Margin'),
//               onPressed: () {
//                 setState(() => margin = 50);
//               },
//             ),
//             ElevatedButton(
//               child: Text('Animate Color'),
//               onPressed: () {
//                 setState(() => color = Colors.red);
//               },
//             ),
//             ElevatedButton(
//               child: Text('Animate Width'),
//               onPressed: () {
//                 setState(() => width = 400);
//               },
//             ),
//             ElevatedButton(
//               child: Text('Animate Opacity'),
//               onPressed: () {
//                 setState(() => opacity = 0);
//               },
//             ),
//             AnimatedOpacity(
//               opacity: opacity,
//               duration: Duration(seconds: 1),
//               child: Text('Hide ME', style: TextStyle(color: Colors.white)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
