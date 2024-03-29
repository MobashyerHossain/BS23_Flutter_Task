import 'enum_values.dart';

enum OwnerType {
  ORGANIZATION,
  USER;

  @override
  String toString() {
    switch (this) {
      case OwnerType.ORGANIZATION:
        return 'Organization';
      case OwnerType.USER:
        return 'User';
      default:
        return ''; // Handle any other cases if needed
    }
  }
}

final typeValues = EnumValues({
  "Organization": OwnerType.ORGANIZATION,
  "User": OwnerType.USER,
});
