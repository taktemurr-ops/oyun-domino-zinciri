import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_domino_zinciri/oyun_domino_zinciri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dominoZinciriConfig.title.length, 33);
    expect(dominoZinciriConfig.tagline.length, 33);
    for (final s in dominoZinciriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dominoZinciriConfig.gameId, dominoZinciriId);
    expect(dominoZinciriRules.gameId, dominoZinciriId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dominoZinciriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dominoZinciriId, optionalMechanics: dominoZinciriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dominoZinciriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
