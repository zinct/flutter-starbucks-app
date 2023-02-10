import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/core/widgets/custom_error_dialog.dart';
import 'package:starbacks/features/home/presentation/bloc/homecategory/home_category_bloc.dart';
import 'package:starbacks/features/home/presentation/shimmer/home_category_tab_shimmer.dart';
import 'package:starbacks/features/home/presentation/shimmer/home_popular_item_shimmer.dart';
import 'package:starbacks/features/home/presentation/widget/home_category_tab_widget.dart';
import 'package:starbacks/features/home/presentation/widget/home_popular_item_widget.dart';
import 'package:starbacks/features/product/presentation/cubit/productlist/product_list_cubit.dart';
import 'package:starbacks/injection_container.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProductListCubit>()..getData()),
        BlocProvider(
            create: (_) =>
                getIt<HomeCategoryBloc>()..add(HomeCategoryEventFetching())),
      ],
      child: const HomeScreenWidget(),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCategoryBloc = context.read<HomeCategoryBloc>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: RefreshIndicator(
        edgeOffset: -50,
        onRefresh: () {
          context.read<ProductListCubit>().getData();
          homeCategoryBloc.add(HomeCategoryEventFetching());

          return Future.delayed(const Duration(seconds: 0));
        },
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                "Our way of loving you back.",
                style: GoogleFonts.raleway().copyWith(
                    fontSize: 25, fontWeight: FontWeight.bold, height: 1.6),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: BaseColors.accentColor,
                borderRadius: BorderRadius.circular(26.5),
              ),
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          UniconsLine.search,
                          color: BaseColors.grey.withOpacity(.4),
                          size: 26,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Text(
                          "Search",
                          style: GoogleFonts.raleway().copyWith(
                            fontSize: 16,
                            color: BaseColors.grey.withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: BlocBuilder<HomeCategoryBloc, HomeCategoryState>(
                builder: (context, state) {
                  print(state.selectedCategory);
                  if (state.status == HomeCategoryStatus.done)
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HomeCategoryTabWidget(
                          label: 'All',
                          isSelected:
                              state.selectedCategory == null ? true : false,
                          onTap: (_) => homeCategoryBloc
                              .add(HomeCategoryEventSelecting(null)),
                        ),
                        ...state.categories.map(
                          (e) => HomeCategoryTabWidget(
                            id: e.id,
                            label: e.name,
                            isSelected: state.selectedCategory?.id == e.id,
                            onTap: (_) {
                              homeCategoryBloc
                                  .add(HomeCategoryEventSelecting(e));
                            },
                          ),
                        ),
                      ],
                    );
                  else
                    return HomeCategoryTabShimmer();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.raleway().copyWith(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(ROUTER.PRODUCT_LIST),
                    child: Text(
                      "See All",
                      style: GoogleFonts.raleway().copyWith(
                          fontSize: 20, color: BaseColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: BlocConsumer<ProductListCubit, ProductListState>(
                listener: (context, state) {
                  if (state is ProductListStateError)
                    showDialog(
                      context: context,
                      builder: (context) => CustomErrorDialog(state.message),
                    );
                },
                builder: ((context, state) {
                  if (state is ProductListStateDone)
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) =>
                          HomePopularItemWidget(state.data[index]),
                      itemCount: state.data.length,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: 20,
                      ),
                    );
                  else
                    return const HomePopularItemShimmer();
                }),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
