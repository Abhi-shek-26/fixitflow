import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<ServiceViewModel>();

      viewModel.loadServices().then((_) {
        if (mounted && widget.categoryId.isNotEmpty) {
          viewModel.filterByCategory(widget.categoryId);
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ServiceViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(ServiceViewModel viewModel) {
    switch (viewModel.state) {
      case ServiceState.initial:
      case ServiceState.loading:
        return const LoadingView();

      case ServiceState.empty:
        return const EmptyView(
          title: 'No services available',
          message: 'There are no services available in this category.',
        );

      case ServiceState.error:
        return ErrorView(
          message: viewModel.errorMessage,
          onRetry: viewModel.retry,
        );

      case ServiceState.loaded:
        return RefreshIndicator(
          color: AppColors.primary,
          onRefresh: viewModel.retry,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                sliver: SliverToBoxAdapter(
                  child: _buildSearch(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${viewModel.services.length} services available',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                sliver: SliverList.separated(
                  itemCount: viewModel.services.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),
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
          ),
        );
    }
  }

  Widget _buildSearch() {
    return TextField(
      controller: _searchController,
      onChanged: _searchServices,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search services',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.textSecondary,
        ),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
          onPressed: () {
            _searchController.clear();
            _searchServices('');
            setState(() {});
          },
          icon: const Icon(
            Icons.close_rounded,
          ),
        )
            : null,
      ),
    );
  }

  void _searchServices(String query) {
    final viewModel = context.read<ServiceViewModel>();
    final allServices = viewModel.allServices;

    if (query.trim().isEmpty) {
      viewModel.filterByCategory(widget.categoryId);
      setState(() {});
      return;
    }

    final searchQuery = query.trim().toLowerCase();

    final results = allServices.where((service) {
      final matchesCategory =
          service.categoryId == widget.categoryId;

      final matchesSearch =
          service.name.toLowerCase().contains(searchQuery) ||
              service.description.toLowerCase().contains(searchQuery);

      return matchesCategory && matchesSearch;
    }).toList();

    viewModel.setSearchResults(results);
    setState(() {});
  }
}