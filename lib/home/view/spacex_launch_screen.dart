import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/api.dart';
import '../logic/spacex_cubit.dart';

class SpaceXScreen extends StatelessWidget {
  const SpaceXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpaceXCubit(spacexService: SpaceXService())..fetchAllLaunches(),
      child: Scaffold(
        appBar: AppBar(title: Text('All SpaceX Launches')),
        body: BlocBuilder<SpaceXCubit, SpaceXState>(
          builder: (context, state) {
            if (state is SpaceXLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SpaceXLoaded) {
              return ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(state.launches[index].imageUrl),
                    title: Text(state.launches[index].name),
                    subtitle: Text(state.launches[index].dateUtc),
                  );
                },
              );
            }
            return Center(child: Text('Failed to load SpaceX launches'));
          },
        ),
      ),
    );
  }
}
