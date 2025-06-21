import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

class HomeScreen extends StatefulWidget {
  final AudioHandler audioHandler;
  const HomeScreen({super.key, required this.audioHandler});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPlaying = true;

  void _togglePlay() async {
    if (isPlaying) {
      await widget.audioHandler.pause();
    } else {
      await widget.audioHandler.play();
    }
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALRC Radio Business"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo_radio.png',
              width: 200,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC300),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            label: Text(isPlaying ? "Pause" : "Écouter en direct"),
            onPressed: _togglePlay,
          ),
          const SizedBox(height: 20),
          Text(
            isPlaying ? "🎶 Lecture en cours..." : "⏸️ En pause",
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
