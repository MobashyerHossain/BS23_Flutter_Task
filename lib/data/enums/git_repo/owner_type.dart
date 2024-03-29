import 'enum_values.dart';

enum OwnerType {
  ORGANIZATION,
  USER,
}

final typeValues = EnumValues({
  "Organization": OwnerType.ORGANIZATION,
  "User": OwnerType.USER,
});
