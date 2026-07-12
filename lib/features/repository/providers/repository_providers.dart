import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/github_api.dart';
import '../../../core/models/repository.dart';
import '../../../core/models/release.dart';

final repositoryProvider = FutureProvider.family<Repository, ({String owner, String repo})>((ref, params) async {
  final api = ref.watch(githubApiProvider);
  return api.getRepository(params.owner, params.repo);
});

final releasesProvider = FutureProvider.family<List<Release>, ({String owner, String repo})>((ref, params) async {
  final api = ref.watch(githubApiProvider);
  return api.getReleases(params.owner, params.repo);
});

final readmeProvider = FutureProvider.family<String, ({String owner, String repo})>((ref, params) async {
  final api = ref.watch(githubApiProvider);
  final base64Content = await api.getReadme(params.owner, params.repo);
  if (base64Content.isEmpty) return '';
  try {
    return utf8.decode(base64.decode(base64Content));
  } catch (e) {
    return base64Content;
  }
});
