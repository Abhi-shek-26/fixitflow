import 'service_model.dart';

class BookingModel {
  final String id;
  final ServiceModel service;
  final DateTime date;
  final String timeSlot;
  final String customerName;
  final String phone;
  final String address;

  const BookingModel({
    required this.id,
    required this.service,
    required this.date,
    required this.timeSlot,
    required this.customerName,
    required this.phone,
    required this.address,
  });
}