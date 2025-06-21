import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class RadioAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  RadioAudioHandler() {
    _init();
  }

  Future<void> _init() async {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.alrc.radio.channel.audio',
      androidNotificationChannelName: 'ALRC Radio Business',
      androidNotificationOngoing: true,
    );

    final mediaItem = MediaItem(
      id: 'https://ice1.somafm.com/groovesalad-128-mp3',
      album: 'ALRC Groupe Média',
      title: 'ALRC Radio Business',
      artUri: Uri.parse('asset:assets/images/logo_radio.png'),
    );

    await _player.setAudioSource(AudioSource.uri(Uri.parse(mediaItem.id)));
    _player.play();
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();
}
