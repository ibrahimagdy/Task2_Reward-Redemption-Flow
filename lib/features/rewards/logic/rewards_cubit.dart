import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/repo/rewards_repo.dart';
import 'rewards_state.dart';

class RewardsCubit extends Cubit<RewardsState> {
  final RewardsRepo _repo = RewardsRepo();
  int _userPoints = 1000;

  RewardsCubit() : super(const RewardsState.initial());

  void loadRewards() {
    emit(const RewardsState.loading());

    Future.delayed(const Duration(milliseconds: 800), () {
      final rewards = _repo.getMockRewards();
      emit(RewardsState.loaded(rewards: rewards, userPoints: _userPoints));
    });
  }

  void redeemReward(RewardModel reward) async {
    final currentState = state;
    if (currentState is! RewardsLoaded) return;

    if (_userPoints < reward.pointsCost) {
      emit(RewardsState.error('Sorry, you do not have enough points to redeem this reward'));
      return;
    }

    emit(const RewardsState.redemptionLoading());

    await Future.delayed(const Duration(milliseconds: 800));

    _userPoints -= reward.pointsCost;

    emit(RewardsState.redemptionSuccess(
      redeemedReward: reward,
      remainingPoints: _userPoints,
    ));
  }
}