import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_task/presentation/widgets/layout_widget.dart';
import '../../core/utils/layout_json_data.dart';
import '../../data/bloc/layout_config/layout_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();

    //load the initial json config
    BlocProvider.of<LayoutBloc>(context)
        .add(LoadLayoutConfig(layoutConfigJson));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<LayoutBloc, LayoutState>(
            builder: (context, state) {
              if (state is LayoutInitial || state is LayoutLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LayoutLoaded) {
                return LayoutWidget(config: state.configModel);
              } else if (state is LayoutError) {
                return Center(
                  child: Text(
                    'Error: ${(state).message}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const Center(child: Text('Unknown state'));
            },
          ),
        ),
      ),
    );
  }
}
