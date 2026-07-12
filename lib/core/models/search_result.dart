import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') bool? incompleteResults,
    List<SearchItem>? items,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

@freezed
class SearchItem with _$SearchItem {
  const factory SearchItem({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    String? description,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    String? language,
    List<String>? topics,
    bool? private,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    SearchItemOwner? owner,
  }) = _SearchItem;

  factory SearchItem.fromJson(Map<String, dynamic> json) =>
      _$SearchItemFromJson(json);
}

@freezed
class SearchItemOwner with _$SearchItemOwner {
  const factory SearchItemOwner({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _SearchItemOwner;

  factory SearchItemOwner.fromJson(Map<String, dynamic> json) =>
      _$SearchItemOwnerFromJson(json);
}
