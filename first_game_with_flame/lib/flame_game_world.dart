import 'package:app/components/player.dart';
import 'package:flame/game.dart';

class FlameGameWorld extends FlameGame {
  final Player _player = Player();
  @override
  Future<void> onLoad() async {
    add(_player);
  }
}
