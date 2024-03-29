import 'enum_values.dart';

enum SortBy {
  STARS,
  UPDATED,
  CREATED;

  @override
  String toString() {
    switch (this) {
      case SortBy.STARS:
        return 'stars';
      case SortBy.UPDATED:
        return 'updated';
      case SortBy.CREATED:
        return 'created';
      default:
        return ''; // Handle any other cases if needed
    }
  }
}

final sortByValues = EnumValues({
  "stars": SortBy.STARS,
  "updated": SortBy.UPDATED,
  "created": SortBy.CREATED,
});
