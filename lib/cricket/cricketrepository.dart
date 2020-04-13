import 'dart:math';
import 'package:mobxdemo/models/cricket.dart';

abstract class CricketRepository {
  Future<Cricketer> fakeCricketerData(String name);
}

class FakeCrickerRepository extends CricketRepository {
  double cachedTempCelsius;

  @override
  Future<Cricketer> fakeCricketerData(String name) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();
        if (random.nextBool()) {
          throw Error();
        }
        cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();

        return Cricketer(name: name, average: cachedTempCelsius);
      },
    );
  }
}
