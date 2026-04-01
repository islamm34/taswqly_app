import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/l10n/translations/app_localizations.dart';
import '../../../../../../navigation_layout/tabs/home/presentation/widgets/section_title.dart';
import 'widgets/advertisements_list.dart';
import 'widgets/categories_list.dart';
import 'widgets/products_list.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const AdvertisementsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SectionTitle(title: locale.categories, viewAllVisibility: true),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const HomeCategoriesList(),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SectionTitle(title: locale.homeAppliance),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const ProductsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
