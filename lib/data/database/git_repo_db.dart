import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../core/constants/db_constants.dart';
import '../models/git_repo/repo_summary.dart';

class GitRepoDatabase {
  late Database database;

  Future open() async {
    database = await openDatabase(
      join(await getDatabasesPath(), '${DBConstants.gitRepoDB}.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE ${DBConstants.gitRepoSummaryTable}('
          'id INTEGER PRIMARY KEY, '
          'node_id TEXT, '
          'name TEXT, '
          'full_name TEXT, '
          'html_url TEXT, '
          'url TEXT, '
          'description TEXT, '
          'language TEXT, '
          'fork INTEGER, '
          'created_at TEXT, '
          'updated_at TEXT, '
          'pushed_at TEXT, '
          'visibility TEXT, '
          'forks INTEGER, '
          'watchers INTEGER, '
          'stargazers_count INTEGER, '
          'score REAL)',
        );
      },
    );
  }

  Future<int> insertRepoSummaries(GitRepoSummary repo) async {
    await open();

    final List<Map<String, dynamic>> existingRecords = await database.query(
      '${DBConstants.gitRepoSummaryTable}',
      where: 'id = ?',
      whereArgs: [repo.id],
    );

    if (existingRecords.isNotEmpty) {
      // ID already exists, handle the error or return a specific value indicating the conflict
      return -1; // You can return any value indicating a conflict
    }

    return await database.insert(
      '${DBConstants.gitRepoSummaryTable}',
      repo.toJson(),
    );
  }

  Future<List<GitRepoSummary>> getRepoSummaries() async {
    await open();
    final List<Map<String, dynamic>> maps = await database.query(
      '${DBConstants.gitRepoSummaryTable}',
    );
    return List.generate(maps.length, (i) {
      return GitRepoSummary.fromJson(
        maps[i],
      );
    });
  }

  Future<void> close() async => database.close();
}
