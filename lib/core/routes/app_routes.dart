import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2_reward_redemption_flow/core/routes/routes_name.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';
import 'package:task2_reward_redemption_flow/features/rewards/logic/rewards_cubit.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/reward_details_screen.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/rewards_list_screen.dart';

class AppRoutes {
  static final RewardsCubit _rewardsCubit = RewardsCubit();

  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.rewardsList:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _rewardsCubit..loadRewards(),
            child: RewardsListScreen(),
          ),
        );
      case Routes.rewardDetails:
        final reward = args as RewardModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _rewardsCubit,
            child: RewardDetailsScreen(reward: reward),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static void dispose() {
    _rewardsCubit.close();
  }
}