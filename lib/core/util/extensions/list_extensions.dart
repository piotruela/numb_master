extension ListExtensions<T> on List<T> {
  List<T> separatedWith(T value) =>
      asMap().entries.expand((entry) => [if (entry.key != 0) value, entry.value]).toList();
}