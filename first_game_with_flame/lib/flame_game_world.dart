import 'dart:ui';

import 'package:app/components/player.dart';
import 'package:app/components/world.dart';
import 'package:app/components/world_collidable.dart';
import 'package:app/helpers/map_loader.dart';
import 'package:flame/game.dart';
import '../helpers/direction.dart';

class FlameGameWorld extends FlameGame with HasCollisionDetection {
  final Player _player = Player();
  final World _world = World();

  @override
  Future<void> onLoad() async {
    await add(_world);
    add(_player);
    addWorldCollision();

    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }

  void addWorldCollision() async =>
      (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
        add(WorldCollidable()
          ..position = Vector2(rect.left, rect.top)
          ..width = rect.width
          ..height = rect.height);
      });
}
