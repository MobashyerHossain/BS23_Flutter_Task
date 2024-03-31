import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starflare/data/enums/git_repo/sort_order.dart';
import 'package:starflare/modules/git_repo/business_logic/git_repo_controller.dart';

import '../../data/enums/git_repo/sort_by.dart';
import '../controllers/shared_pref_controller.dart';
import 'helpers/theme_mode_toggle_button.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SharedPrefController sharedPrefController =
        Get.find<SharedPrefController>(tag: 'sharedPrefController');
    final GitRepoController gitRepoController =
        Get.find<GitRepoController>(tag: 'gitRepoController');

    return SafeArea(
      child: Obx(
        () => Container(
          width: 270.0,
          decoration: BoxDecoration(
            color: sharedPrefController.getIsDark ? Colors.black : Colors.white,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("App Theme"),
                  ThemeModeToggleButton(),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Sorted Order"),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 30.0,
                    ),
                    child: ToggleButtons(
                      selectedColor: Colors.black,
                      fillColor: Colors.grey,
                      borderWidth: 3,
                      borderRadius: BorderRadius.circular(20),
                      isSelected: List.generate(
                        SortOrder.values.length,
                        (index) {
                          return sharedPrefController.getSortOrder ==
                              SortOrder.values
                                  .map(
                                    (e) => e.toString(),
                                  )
                                  .toList()[index];
                        },
                      ),
                      children: const [
                        Row(
                          children: [
                            Icon(
                              Icons.sort,
                              size: 20.0,
                            ),
                            Icon(
                              Icons.arrow_upward_rounded,
                              size: 20.0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.sort,
                              size: 20.0,
                            ),
                            Icon(
                              Icons.arrow_downward_rounded,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ],
                      onPressed: (index) {
                        sharedPrefController.setSortOrder(
                          SortOrder.values
                              .map(
                                (e) => e.toString(),
                              )
                              .toList()[index],
                        );

                        gitRepoController.sortRepos();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  const Text(
                    "Sorted By",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 40.0,
                    ),
                    child: ToggleButtons(
                      selectedColor: Colors.black,
                      fillColor: Colors.grey,
                      direction: Axis.horizontal,
                      borderWidth: 3,
                      borderRadius: BorderRadius.circular(20),
                      isSelected: List.generate(
                        SortBy.values.length,
                        (index) =>
                            sharedPrefController.getSortBy ==
                            SortBy.values
                                .map(
                                  (e) => e.toString(),
                                )
                                .toList()[index],
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                              ),
                              Text(
                                " Count",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Updated",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Created",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      onPressed: (index) {
                        sharedPrefController.setSortBy(
                          SortBy.values
                              .map(
                                (e) => e.toString(),
                              )
                              .toList()[index],
                        );

                        gitRepoController.sortRepos();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
