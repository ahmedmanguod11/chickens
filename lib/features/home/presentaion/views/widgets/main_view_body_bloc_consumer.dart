import 'package:chickens/core/helper_functions/build_error_bar.dart';
import 'package:chickens/features/home/presentaion/cubits/cart_cubit/cart_cubit.dart';
import 'package:chickens/features/home/presentaion/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showBar(context, 'تمت الاضافة الى السلة بنجاح');
        }
        if (state is CartItemRemoved) {
          showBar(context, 'تم حذف المنتج بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
