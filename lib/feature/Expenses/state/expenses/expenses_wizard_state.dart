import 'dart:io';

class ItemEntry {
  String details = '';
  double price = 0;
  int quantity = 0;

  double get total => price * quantity;
}

class ExpensesWizardState {
  final String? selectedCompany;
  final String? selectedRequestType;
  final String? selectedBranch;
  final DateTime? fromDate;
  final DateTime? toDate;
  final List<ItemEntry> items;
  final List<File> images;
  final List<String> comments;

  ExpensesWizardState({
    this.selectedCompany,
    this.selectedRequestType,
    this.selectedBranch,
    this.fromDate,
    this.toDate,
    this.items = const [],
    this.images = const [],
    this.comments = const [],
  });

  ExpensesWizardState copyWith({
    String? selectedCompany,
    String? selectedRequestType,
    String? selectedBranch,
    DateTime? fromDate,
    DateTime? toDate,
    List<ItemEntry>? items,
    List<File>? images,
    List<String>? comments,
  }) {
    return ExpensesWizardState(
      selectedCompany: selectedCompany ?? this.selectedCompany,
      selectedRequestType: selectedRequestType ?? this.selectedRequestType,
      selectedBranch: selectedBranch ?? this.selectedBranch,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      items: items ?? this.items,
      images: images ?? this.images,
      comments: comments ?? this.comments,
    );
  }

  double get totalSum => items.fold(0, (sum, item) => sum + item.total);
}