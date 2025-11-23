import 'package:equatable/equatable.dart';

/// Generic paginated result wrapper for list endpoints
class PaginatedResult<T> extends Equatable {
  const PaginatedResult({
    required this.items,
    required this.page,
    required this.limit,
    required this.totalItems,
    required this.totalPages,
  });
  final List<T> items;
  final int page;
  final int limit;
  final int totalItems;
  final int totalPages;

  bool get hasNextPage => page < totalPages;
  bool get hasPreviousPage => page > 1;

  @override
  List<Object?> get props => [items, page, limit, totalItems, totalPages];
}
