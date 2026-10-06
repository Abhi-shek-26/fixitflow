import 'package:fixit_flow/data/repositories/service_repository.dart';
import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';

enum HomeState{
  initial, loading,loaded,empty,error,
}

class HomeViewModel extends ChangeNotifier{
  final ServiceRepository _repository;


  HomeViewModel(this._repository);

  HomeState _state = HomeState.initial;
  HomeState get state => _state;

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void>loadCategories() async{
    _state = HomeState.loading;
    _errorMessage = '';
    notifyListeners();


    try{
      final result = await _repository.getCategories();

      if(result.isEmpty){
        _categories = [];
        _state = HomeState.empty;
      }else{
        _categories = result;
        _state = HomeState.loaded;
      }
    }catch (e){
      _state = HomeState.error;
      _errorMessage = 'unable to load categories. Please try again later.';
    }
    notifyListeners();
  }

  Future<void>retry() async{
    await loadCategories();
  }
}