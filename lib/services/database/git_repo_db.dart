import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:starflare/data/models/git_repo/git_user.dart';
import 'package:starflare/data/models/git_repo/git_repo.dart';

import '../../core/constants/db_constants.dart';
import '../../data/models/git_repo/repo_summary.dart';

class GitRepoDatabase {
  late Database database;

  Future open() async {
    database = await openDatabase(
      join(await getDatabasesPath(), '${DBConstants.gitRepoDB}.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE ${DBConstants.gitRepoSummaryTable}('
          'id INTEGER PRIMARY KEY, '
          'node_id TEXT, '
          'name TEXT, '
          'full_name TEXT, '
          'url TEXT, '
          'description TEXT, '
          'language TEXT, '
          'created_at TEXT, '
          'updated_at TEXT, '
          'pushed_at TEXT, '
          'visibility TEXT, '
          'stargazers_count INTEGER)',
        );

        await db.execute(
          'CREATE TABLE ${DBConstants.gitRepoTable}('
          'id INTEGER PRIMARY KEY, '
          'node_id TEXT, '
          'name TEXT, '
          'full_name TEXT, '
          'owner_url TEXT, '
          'url TEXT, '
          'description TEXT, '
          'languages_url TEXT, '
          'created_at TEXT, '
          'updated_at TEXT, '
          'pushed_at TEXT, '
          'size INTEGER, '
          'stargazers_count INTEGER, '
          'watchers_count INTEGER, '
          'language TEXT, '
          'topics TEXT, '
          'visibility TEXT, '
          'watchers INTEGER, '
          'default_branch TEXT, '
          'score REAL)',
        );

        await db.execute(
          'CREATE TABLE ${DBConstants.gitUserTable}('
          'id INTEGER PRIMARY KEY, '
          'login TEXT, '
          'node_id TEXT, '
          'url TEXT, '
          'avatar_url TEXT, '
          'repos_url TEXT, '
          'type TEXT, '
          'name TEXT, '
          'public_repos INTEGER, '
          'followers INTEGER, '
          'following INTEGER, '
          'created_at TEXT, '
          'updated_at TEXT)',
        );
      },
    );
  }

  Future<int> insertRepoSummaries(GitRepoSummary repoSummary) async {
    await open();

    final List<Map<String, dynamic>> existingRecords = await database.query(
      DBConstants.gitRepoSummaryTable,
      where: 'id = ?',
      whereArgs: [repoSummary.id],
    );

    if (existingRecords.isNotEmpty) {
      // ID already exists, handle the error or return a specific value indicating the conflict
      return -1; // You can return any value indicating a conflict
    }

    return await database.insert(
      DBConstants.gitRepoSummaryTable,
      repoSummary.toJson(),
    );
  }

  Future<List<GitRepoSummary>> getRepoSummaries() async {
    await open();
    final List<Map<String, dynamic>> maps = await database.query(
      DBConstants.gitRepoSummaryTable,
    );
    return List.generate(maps.length, (i) {
      return GitRepoSummary.fromJson(
        maps[i],
      );
    });
  }

  Future<int> insertRepo(GitRepository repo) async {
    await open();

    final List<Map<String, dynamic>> existingRecords = await database.query(
      DBConstants.gitRepoTable,
      where: 'id = ?',
      whereArgs: [repo.id],
    );

    if (existingRecords.isNotEmpty) {
      // ID already exists, handle the error or return a specific value indicating the conflict
      return -1; // You can return any value indicating a conflict
    }

    return await database.insert(
      DBConstants.gitRepoTable,
      repo.toJson(),
    );
  }

  Future<GitRepository?> getRepo(String repoUrl) async {
    await open();
    final List<Map<String, dynamic>> existingRecords = await database.query(
      DBConstants.gitRepoTable,
      where: 'url = ?',
      whereArgs: [repoUrl],
    );
    if (existingRecords.isNotEmpty) {
      return GitRepository.fromDatabase(
        existingRecords.first,
      );
    } else {
      return null;
    }
  }

  Future<int> insertUser(GitUser user) async {
    await open();

    final List<Map<String, dynamic>> existingRecords = await database.query(
      DBConstants.gitUserTable,
      where: 'id = ?',
      whereArgs: [user.id],
    );

    if (existingRecords.isNotEmpty) {
      // ID already exists, handle the error or return a specific value indicating the conflict
      return -1; // You can return any value indicating a conflict
    }

    return await database.insert(
      DBConstants.gitUserTable,
      user.toJson(),
    );
  }

  Future<GitUser?> getUser(String userUrl) async {
    await open();
    final List<Map<String, dynamic>> existingRecords = await database.query(
      DBConstants.gitUserTable,
      where: 'url = ?',
      whereArgs: [userUrl],
    );
    if (existingRecords.isNotEmpty) {
      return GitUser.fromDatabase(
        existingRecords.first,
      );
    } else {
      return null;
    }
  }

  Future<void> close() async => database.close();
}
