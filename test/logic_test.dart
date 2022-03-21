import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_countup/logic.dart';

void main() {
  Logic target = Logic();

  setUp(() async {
    target = Logic();
  });

  test('init', () async {
    expect(target.count, 0);
    expect(target.countUp, 0);
    expect(target.countDown, 0);
  });

  test('increase', () async {});

  test('decrease', () async {});

  test('reset', () async {});
}
