import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';

class RewardsRepo {
  List<RewardModel> getMockRewards() {
    return [
      RewardModel(
        id: 'R001',
        name: 'EGP 50 Discount Voucher',
        description: 'A discount voucher worth EGP 50 usable at any partner store',
        imageUrl: '🎫',
        pointsCost: 500,
        category: 'Discounts',
      ),
      RewardModel(
        id: 'R002',
        name: 'Drop Me Mug',
        description: 'Eco-friendly bamboo mug with Drop Me logo',
        imageUrl: '☕',
        pointsCost: 200,
        category: 'Products',
      ),
      RewardModel(
        id: 'R003',
        name: 'Drop Me T-Shirt',
        description: 'Organic cotton t-shirt with an inspiring environmental message',
        imageUrl: '👕',
        pointsCost: 800,
        category: 'Clothing',
      ),
      RewardModel(
        id: 'R004',
        name: 'Reusable Shopping Bag',
        description: 'Eco-friendly reusable shopping bag',
        imageUrl: '🛍️',
        pointsCost: 150,
        category: 'Products',
      ),
      RewardModel(
        id: 'R005',
        name: '20% Off at Green Restaurant',
        description: 'Get 20% off your next meal at Green healthy restaurant chain',
        imageUrl: '🥗',
        pointsCost: 300,
        category: 'Food',
      ),
    ];
  }
}
