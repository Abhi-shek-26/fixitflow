import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../models/service_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildImage(context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                    sliver: SliverToBoxAdapter(
                      child: _buildContent(),
                    ),
                  ),
                ],
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 280,
          width: double.infinity,
          child: Image.network(
            service.image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                color: AppColors.lightPrimary,
                child: const Icon(
                  Icons.home_repair_service_rounded,
                  size: 70,
                  color: AppColors.primary,
                ),
              );
            },
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }

              return Container(
                color: AppColors.background,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: _buildCircleButton(
            icon: Icons.arrow_back_rounded,
            onTap: () => context.pop(),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: _buildCircleButton(
            icon: Icons.favorite_border_rounded,
            onTap: () {},
          ),
        ),
        Positioned(
          left: 20,
          bottom: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              service.categoryId
                  .replaceAll('_', ' ')
                  .toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          height: 44,
          width: 44,
          child: Icon(
            icon,
            color: AppColors.textPrimary,
            size: 21,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.name,
          style: const TextStyle(
            fontSize: 25,
            height: 1.2,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4D8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 17,
                    color: AppColors.warning,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    service.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${service.reviewCount} reviews',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 14),
            Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.textSecondary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 14),
            const Icon(
              Icons.verified_rounded,
              size: 16,
              color: AppColors.success,
            ),
            const SizedBox(width: 4),
            const Text(
              'Verified',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.success,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildInfoRow(),
        const SizedBox(height: 28),
        _buildSection(
          title: 'About this service',
          child: Text(
            service.description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.65,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 28),
        _buildSection(
          title: 'What’s included',
          child: Column(
            children: const [
              _IncludedItem(
                icon: Icons.verified_user_outlined,
                text: 'Verified and experienced professional',
              ),
              _IncludedItem(
                icon: Icons.home_repair_service_outlined,
                text: 'Professional service at your doorstep',
              ),
              _IncludedItem(
                icon: Icons.receipt_long_outlined,
                text: 'Transparent service pricing',
              ),
              _IncludedItem(
                icon: Icons.support_agent_outlined,
                text: 'Customer support assistance',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _InfoItem(
              icon: Icons.payments_outlined,
              label: 'Starting from',
              value: '₹${service.price.toStringAsFixed(0)}',
            ),
          ),
          Container(
            height: 42,
            width: 1,
            color: AppColors.border,
          ),
          Expanded(
            child: _InfoItem(
              icon: Icons.schedule_outlined,
              label: 'Duration',
              value: service.duration,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Service price',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '₹${service.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  context.push(
                    AppRouter.booking,
                    extra: service,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.lightPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IncludedItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IncludedItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: AppColors.lightPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 17,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}