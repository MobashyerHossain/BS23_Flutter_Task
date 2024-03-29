import 'enum_values.dart';

enum Visibility {
  PUBLIC,
  PRIVATE;

  @override
  String toString() {
    switch (this) {
      case Visibility.PUBLIC:
        return 'Public';
      case Visibility.PRIVATE:
        return 'Private';
      default:
        return ''; // Handle any other cases if needed
    }
  }
}

final visibilityValues = EnumValues({
  "public": Visibility.PUBLIC,
  "private": Visibility.PRIVATE,
});
