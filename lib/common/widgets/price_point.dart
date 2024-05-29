

class PricePoint {
  final dynamic x; // index
  final dynamic y; // priceValue

  PricePoint({required this.x, required this.y});
}

// List<PricePoint> get pricePoints {
//   final data = <double>[2, 4, 6, 11, 3, 6, 4];
//   return data.asMap().entries.map((entry) {
//     final index = entry.key.toDouble(); // Get the index as a double
//     final value = entry.value;
//     return PricePoint(x: index, y: value);
//   }).toList();
// }