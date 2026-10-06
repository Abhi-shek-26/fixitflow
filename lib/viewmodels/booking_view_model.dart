import 'package:flutter/foundation.dart';

import '../models/booking_model.dart';
import '../models/service_model.dart';

class BookingViewModel extends ChangeNotifier {
  ServiceModel? _selectedService;
  ServiceModel? get selectedService => _selectedService;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  String? _selectedTimeSlot;
  String? get selectedTimeSlot => _selectedTimeSlot;

  String _customerName = '';
  String get customerName => _customerName;

  String _phone = '';
  String get phone => _phone;

  String _address = '';
  String get address => _address;

  BookingModel? _booking;
  BookingModel? get booking => _booking;

  final List<BookingModel> _bookings = [];

  List<BookingModel> get bookings {
    return List.unmodifiable(_bookings);
  }

  void setService(ServiceModel service) {
    _selectedService = service;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setTimeSlot(String timeSlot) {
    _selectedTimeSlot = timeSlot;
    notifyListeners();
  }

  void setCustomerDetails({
    required String name,
    required String phone,
    required String address,
  }) {
    _customerName = name;
    _phone = phone;
    _address = address;

    notifyListeners();
  }

  bool get canBook {
    return _selectedService != null &&
        _selectedDate != null &&
        _selectedTimeSlot != null &&
        _customerName.trim().isNotEmpty &&
        _phone.trim().isNotEmpty &&
        _address.trim().isNotEmpty;
  }

  void createBooking() {
    if (!canBook) {
      return;
    }

    final newBooking = BookingModel(
      id: 'FMT${DateTime.now().millisecondsSinceEpoch}',
      service: _selectedService!,
      date: _selectedDate!,
      timeSlot: _selectedTimeSlot!,
      customerName: _customerName.trim(),
      phone: _phone.trim(),
      address: _address.trim(),
    );

    _booking = newBooking;

    _bookings.insert(
      0,
      newBooking,
    );

    notifyListeners();
  }

  void clearCurrentBooking() {
    _selectedService = null;
    _selectedDate = null;
    _selectedTimeSlot = null;
    _customerName = '';
    _phone = '';
    _address = '';
    _booking = null;

    notifyListeners();
  }
}