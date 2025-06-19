import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../state/expenses/expenses_wizard_state.dart';

class ExpensesWizardViewModel extends ChangeNotifier {
  int currentStep = 0;

  ExpensesWizardState _state = ExpensesWizardState(items: [ItemEntry()]);

  ExpensesWizardState get state => _state;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  List<String> get companies => ['شركة A', 'شركة B', 'شركة C'];
  List<String> get requestTypes => ['طلب 1', 'طلب 2', 'طلب 3'];
  List<String> get branches => ['فرع القاهرة', 'فرع جدة', 'فرع الرياض'];

  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }

  void setCompany(String? value) {
    _state = _state.copyWith(selectedCompany: value);
    notifyListeners();
  }

  void setRequestType(String? value) {
    _state = _state.copyWith(selectedRequestType: value);
    notifyListeners();
  }

  void setBranch(String? value) {
    _state = _state.copyWith(selectedBranch: value);
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context, bool isFromDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      _state = isFromDate
          ? _state.copyWith(fromDate: picked)
          : _state.copyWith(toDate: picked);
      notifyListeners();
    }
  }

  void addItem() {
    final updatedItems = [..._state.items, ItemEntry()];
    _state = _state.copyWith(items: updatedItems);
    notifyListeners();
  }

  void removeItem(int index) {
    final updatedItems = [..._state.items]..removeAt(index);
    _state = _state.copyWith(items: updatedItems);
    notifyListeners();
  }

  void updateItem(int index, {double? price, int? quantity, String? details}) {
    final updatedItem = _state.items[index];
    if (price != null) updatedItem.price = price;
    if (quantity != null) updatedItem.quantity = quantity;
    if (details != null) updatedItem.details = details;

    final updatedItems = [..._state.items];
    updatedItems[index] = updatedItem;

    _state = _state.copyWith(items: updatedItems);
    notifyListeners();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final updatedImages = [..._state.images, File(picked.path)];
      _state = _state.copyWith(images: updatedImages);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    final updatedImages = [..._state.images]..removeAt(index);
    _state = _state.copyWith(images: updatedImages);
    notifyListeners();
  }

  void addComment(String comment) {
    final updated = [..._state.comments, comment];
    _state = _state.copyWith(comments: updated);
    notifyListeners();
  }
}