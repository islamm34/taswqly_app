import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/utils/resource.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'category_widget.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 260,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.categoriesApi.status == ApiStatus.success &&
                state.categoriesApi.data != null) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  return CategoryWidget(
                    category: state.categoriesApi.data![index],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: state.categoriesApi.data!.length,
              );
            } else if (state.categoriesApi.status == ApiStatus.error) {
              return Text(state.categoriesApi.errorMessage ?? "");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
