import 'enum_values.dart';

enum SortOrder {
  ASC,
  DESC;

  @override
  String toString() {
    switch (this) {
      case SortOrder.ASC:
        return 'asc';
      case SortOrder.DESC:
        return 'dsc';
      default:
        return ''; // Handle any other cases if needed
    }
  }
}
