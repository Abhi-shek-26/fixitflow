import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../data/repositories/service_repository.dart';
import '../../viewmodels/service_view_model.dart';
import '../../widgets/service_card.dart';
import '../../widgets/state_view.dart';

class ServiceListScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const ServiceListScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final TextEditingController _searchController =
  TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadServices();
    });

    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadServices() async {
    final viewModel = context.read<ServiceViewModel>();

    if (viewModel.allServices.isEmpty) {
      await viewModel.loadServices();
    }

    if (!mounted) return;

    viewModel.filterByCategory(widget.categoryId);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    final viewModel = context.read<ServiceViewModel>();

    if (query.isEmpty) {
      viewModel.filterByCategory(widget.categoryId);
      return;
    }

    final results = viewModel.allServices
        .where(
          (service) =>
      service.categoryId == widget.categoryId &&
          (service.name.toLowerCase().contains(query) ||
              service.description.toLowerCase().contains(query)),
    )
        .toList();

    viewModel.setSearchResults(results);
  }

  Future<void> _refresh() async {
    await context.read<ServiceViewModel>().loadServices();

    if (!mounted) return;

    context
        .read<ServiceViewModel>()
        .filterByCategory(widget.categoryId);

    if (_searchController.text.isNotEmpty) {
      _onSearchChanged();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Consumer<ServiceViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.state == ServiceState.initial ||
              viewModel.state == ServiceState.loading) {
            return const LoadingView(
              message: 'Finding services...',
            );
          }

          if (viewModel.state == ServiceState.error) {
            return ErrorView(
              message: viewModel.errorMessage,
              onRetry: _refresh,
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: _refresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  sliver: SliverToBoxAdapter(
                    child: _buildSearchBar(),
                  ),
                ),
                if (viewModel.state == ServiceState.empty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyView(
                      title: _searchController.text.isEmpty
                          ? 'No services available'
                          : 'No matching services',
                      message: _searchController.text.isEmpty
                          ? 'There are currently no services in this category.'
                          : 'Try searching with a different service name.',
                      icon: _searchController.text.isEmpty
                          ? Icons.home_repair_service_outlined
                          : Icons.search_off_rounded,
                      onAction: _searchController.text.isEmpty
                          ? _refresh
                          : () {
                        _searchController.clear();
                      },
                      actionText: _searchController.text.isEmpty
                          ? 'Try Again'
                          : 'Clear Search',
                    ),
                  )
                else ...[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: _buildResultHeader(
                        viewModel.services.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 14),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    sliver: SliverList.separated(
                      itemCount: viewModel.services.length,
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final service = viewModel.services[index];

                        return ServiceCard(
                          service: service,
                          onTap: () {
                            context.push(
                              AppRouter.serviceDetails,
                              extra: service,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search services...',
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 21,
        ),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
          onPressed: () {
            _searchController.clear();
            setState(() {});
          },
          icon: const Icon(
            Icons.close_rounded,
            size: 19,
          ),
        )
            : null,
      ),
      onChanged: (_) {
        setState(() {});
      },
    );
  }

  Widget _buildResultHeader(int count) {
    return Row(
      children: [
        Text(
          '$count ${count == 1 ? 'service' : 'services'} available',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.tune_rounded,
          size: 17,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 5),
        const Text(
          'Nearby services',
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}