import '../models/my_assets.dart';
import '../models/category.dart';

final dummyAssets = [
  const MyAsset(
    id: '1',
    name: 'BTC',
    quantity: 2,
    buyPrice: 57635,
    category: Categories.layer1,
  ),
  const MyAsset(
    id: '2',
    name: 'USDT',
    quantity: 2100.0,
    buyPrice: 1,
    category: Categories.stablecoins,
  ),
  const MyAsset(
    id: '3',
    name: 'ETH',
    quantity: 5,
    buyPrice: 2768,
    category: Categories.meme,
  ),
];