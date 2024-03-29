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
        return 'desc';
      default:
        return ''; // Handle any other cases if needed
    }
  }
}

final sortOrderValues = EnumValues({
  "asc": SortOrder.ASC,
  "desc": SortOrder.DESC,
});
