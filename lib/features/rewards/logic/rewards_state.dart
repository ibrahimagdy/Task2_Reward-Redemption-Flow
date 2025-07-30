import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';

part 'rewards_state.freezed.dart';

@freezed
class RewardsState with _$RewardsState {
  const factory RewardsState.initial() = RewardsInitial;
  const factory RewardsState.loading() = RewardsLoading;
  const factory RewardsState.loaded({
    required List<RewardModel> rewards,
    required int userPoints,
  }) = RewardsLoaded;
  const factory RewardsState.redemptionLoading() = RedemptionLoading;
  const factory RewardsState.redemptionSuccess({
    required RewardModel redeemedReward,
    required int remainingPoints,
  }) = RedemptionSuccess;
  const factory RewardsState.error(String message) = RewardsError;
}
