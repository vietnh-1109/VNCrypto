import 'package:vn_crypto/data/model/global.dart';
import 'package:vn_crypto/data/model/item_coin.dart';
import 'package:vn_crypto/data/model/item_trending_coin.dart';
import 'package:vn_crypto/data/service/api.dart';

class ListCoinRepository {
  final Api api;

  ListCoinRepository({required this.api});

  Future<List<ItemCoin>> getCoins(String currency) => api.getCoins(currency);

  Future<List<ItemTrendingCoin>> getTrendingCoins() => api.getTrendingCoins();

  Future<Global> getGlobalInfo() => api.getGlobalInfo();
}
