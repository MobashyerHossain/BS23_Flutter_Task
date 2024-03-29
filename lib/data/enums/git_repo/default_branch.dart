import 'enum_values.dart';

enum DefaultBranch {
  MAIN,
  MASTER;

  @override
  String toString() {
    switch (this) {
      case DefaultBranch.MAIN:
        return 'Main';
      case DefaultBranch.MASTER:
        return 'Master';
      default:
        return ''; // Handle any other cases if needed
    }
  }
}

final defaultBranchValues = EnumValues({
  "main": DefaultBranch.MAIN,
  "master": DefaultBranch.MASTER,
});
