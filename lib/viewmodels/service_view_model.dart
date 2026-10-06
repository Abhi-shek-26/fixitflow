import 'package:flutter/foundation.dart';

import '../data/repositories/service_repository.dart';
import '../models/service_model.dart';

enum ServiceState {
  initial,
  loading,
  loaded,
  empty,
  error,
}

class ServiceViewModel extends ChangeNotifier {
  final ServiceRepository _repository;

  ServiceViewModel(this._repository);

  ServiceState _state = ServiceState.initial;
  ServiceState get state => _state;

  List<ServiceModel> _allServices = [];
  List<ServiceModel> get allServices => _allServices;

  List<ServiceModel> _services = [];
  List<ServiceModel> get services => _services;

  String _selectedCategoryId = '';
  String get selectedCategoryId => _selectedCategoryId;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loadServices() async {
    _state = ServiceState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      final result = await _repository.getServices();

      _allServices = result;
      _services = result;

      if (result.isEmpty) {
        _state = ServiceState.empty;
      } else {
        _state = ServiceState.loaded;
      }
    } catch (e) {
      _state = ServiceState.error;
      _errorMessage = 'Unable to load services. Please try again.';
    }

    notifyListeners();
  }

  void filterByCategory(String categoryId) {
    _selectedCategoryId = categoryId;

    _services = _allServices
        .where((service) => service.categoryId == categoryId)
        .toList();

    if (_services.isEmpty) {
      _state = ServiceState.empty;
    } else {
      _state = ServiceState.loaded;
    }

    notifyListeners();
  }

  Future<void> retry() async {
    await loadServices();

    if (_selectedCategoryId.isNotEmpty) {
      filterByCategory(_selectedCategoryId);
    }
  }
}