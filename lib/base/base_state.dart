import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_builder_demo/di/modules.dart';

abstract class BaseState<T extends StatefulWidget, G extends Cubit<S>, S>
    extends State<T> {
  @protected
  late G cubit;

  BaseState() : super() {
    cubit = getIt.get<G>();
  }

  BaseState.empty() : super();

  BaseState.withParams({dynamic param1, dynamic param2}) : super() {
    cubit = getIt.get<G>(param1: param1, param2: param2);
  }

  @override
  void initState() {
    try {
      // ignore: unnecessary_statements
      cubit;
    } catch (e) {
      throw 'At first you need init the cubit in [initState] or in [getIt]';
    }
    super.initState();
  }

  Widget builder(BuildContext context, S state);

  void listener(BuildContext context, S state) {}

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<G, S>(
        builder: builder,
        listener: listener,
      ),
    );
  }
}
