import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_constants.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../models/service_model.dart';
import '../../viewmodels/booking_view_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/date_selector.dart';
import '../../widgets/time_slot_chip.dart';

class BookingScreen extends StatefulWidget {
  final ServiceModel service;

  const BookingScreen({
    super.key,
    required this.service,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<BookingViewModel>().setService(widget.service);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _confirmBooking() {
    final bookingViewModel = context.read<BookingViewModel>();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (bookingViewModel.selectedDate == null) {
      _showMessage('Please select a booking date.');
      return;
    }

    if (bookingViewModel.selectedTimeSlot == null) {
      _showMessage('Please select a time slot.');
      return;
    }

    bookingViewModel.setCustomerDetails(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
    );

    bookingViewModel.createBooking();

    if (bookingViewModel.booking != null && mounted) {
      context.push(AppRouter.confirmation);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  String? _validateName(String? value) {
    final name = value?.trim() ?? '';

    if (name.isEmpty) {
      return 'Please enter your name';
    }

    if (name.length < 2) {
      return 'Name must contain at least 2 characters';
    }

    return null;
  }

  String? _validatePhone(String? value) {
    final phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return 'Please enter your phone number';
    }

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(phone)) {
      return 'Enter a valid 10-digit phone number';
    }

    return null;
  }

  String? _validateAddress(String? value) {
    final address = value?.trim() ?? '';

    if (address.isEmpty) {
      return 'Please enter your address';
    }

    if (address.length < 10) {
      return 'Please enter a complete address';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Book Service',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildServiceSummary(),
                const SizedBox(height: 28),
                _buildSectionTitle(
                  'Select date',
                  'Choose a convenient date',
                ),
                const SizedBox(height: 14),
                Consumer<BookingViewModel>(
                  builder: (context, viewModel, _) {
                    return DateSelector(
                      selectedDate: viewModel.selectedDate,
                      onDateSelected: viewModel.setDate,
                    );
                  },
                ),
                const SizedBox(height: 28),
                _buildSectionTitle(
                  'Select time',
                  'Choose an available time slot',
                ),
                const SizedBox(height: 14),
                Consumer<BookingViewModel>(
                  builder: (context, viewModel, _) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: AppConstants.bookingTimeSlots.map(
                            (slot) {
                          return TimeSlotChip(
                            time: slot,
                            isSelected:
                            viewModel.selectedTimeSlot == slot,
                            onTap: () {
                              viewModel.setTimeSlot(slot);
                            },
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
                const SizedBox(height: 30),
                _buildSectionTitle(
                  'Your details',
                  'Tell us where the service is needed',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Full name',
                  hintText: 'Enter your full name',
                  controller: _nameController,
                  prefixIcon: Icons.person_outline_rounded,
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone number',
                  hintText: 'Enter 10-digit phone number',
                  controller: _phoneController,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: _validatePhone,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Service address',
                  hintText: 'Enter your complete address',
                  controller: _addressController,
                  prefixIcon: Icons.location_on_outlined,
                  maxLines: 3,
                  validator: _validateAddress,
                ),
                const SizedBox(height: 30),
                _buildPriceSummary(),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Confirm Booking',
                  onPressed: _confirmBooking,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceSummary() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: SizedBox(
              height: 76,
              width: 76,
              child: Image.network(
                widget.service.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: AppColors.lightPrimary,
                    child: const Icon(
                      Icons.home_repair_service_rounded,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.service.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: AppColors.warning,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.service.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.schedule_outlined,
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        widget.service.duration,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
      String title,
      String subtitle,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSummary() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightPrimary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.receipt_long_outlined,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estimated service price',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Final price may vary based on service requirements',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '₹${widget.service.price.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}