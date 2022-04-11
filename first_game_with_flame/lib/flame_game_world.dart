import 'dart:ui';

import 'package:app/components/player.dart';
import 'package:app/components/world.dart';
import 'package:flame/game.dart';
import '../helpers/direction.dart';

class FlameGameWorld extends FlameGame {
  final Player _player = Player();
  final World _world = World();

  @override
  Future<void> onLoad() async {
    await add(_world);
    add(_player);

    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
