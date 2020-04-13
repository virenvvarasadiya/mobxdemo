class Cricketer {
  String name;
  double average;
  Cricketer({this.average, this.name});
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cricketer && o.name == name && o.average == average;
  }

  @override
  int get hashCode => name.hashCode ^ average.hashCode;
}
