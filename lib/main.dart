import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'background_audio.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final audioHandler = await AudioService.init(
    builder: () => RadioAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.alrc.radio.channel.audio',
      androidNotificationChannelName: 'ALRC Radio Business',
      androidNotificationOngoing: true,
    ),
  );
  runApp(ALRCRadioApp(audioHandler: audioHandler));
}

class ALRCRadioApp extends StatelessWidget {
  final AudioHandler audioHandler;
  const ALRCRadioApp({super.key, required this.audioHandler});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALRC Radio Business',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFD00000),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD00000),
          foregroundColor: Colors.white,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Roboto',
              bodyColor: Colors.black,
            ),
      ),
      home: HomeScreen(audioHandler: audioHandler),
    );
  }
}
