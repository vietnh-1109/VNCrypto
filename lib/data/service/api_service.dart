import 'package:dio/dio.dart';
import 'package:vn_crypto/data/model/category.dart';
import 'package:vn_crypto/data/model/coin_response.dart';
import 'package:vn_crypto/data/model/global.dart';
import 'package:vn_crypto/data/model/item_coin.dart';
import 'package:vn_crypto/data/model/item_coin_response.dart';
import 'package:vn_crypto/data/model/item_trending_coin.dart';
import 'package:vn_crypto/data/service/url.dart';

class Api {
  Api({
    Dio? dio,
  }) : dio = dio ?? Dio() {
    this.dio.interceptors.add(LogInterceptor());
  }

  final Dio dio;

  Future<List<ItemCoin>> getCoins(String currency) async {
    final response = await dio
        .get(Url.GET_COINS_URL, queryParameters: {'vs_currency': currency});
    List<ItemCoin> itemCoins = [];
    List<dynamic> itemCoinsReponse = response.data as List;
    for (int i = 0; i < itemCoinsReponse.length; i++) {
      itemCoins.add(ItemCoin.fromJson(itemCoinsReponse[i]));
    }
    return itemCoins;
  }

  Future<List<ItemTrendingCoin>> getTrendingCoins() async {
    final response = await dio.get(Url.GET_TRENDING_URL);
    CoinResponse coinResponse = CoinResponse.fromJson(response.data);
    List<ItemCoinResponse> coinResponses = coinResponse.coinResponses;
    List<ItemTrendingCoin> trendingCoins = [];
    for (ItemCoinResponse itemCoinResponse in coinResponses) {
      trendingCoins.add(itemCoinResponse.coin);
    }
    return trendingCoins;
  }

  Future<List<Category>> getCategories() async {
    final response = await dio.get(Url.GET_CATEGORIES);
    List<Category> categories = [];
    List<dynamic> categoryResponses = response.data as List;
    for (int i = 0; i < categoryResponses.length; i++) {
      categories.add(Category.fromJson(categoryResponses[i]));
    }
    return categories;
  }

  Future<Global> getGlobalInfo() async {
    final response = await dio.get(Url.GET_GLOBAL_INFO);
    Global global = Global.fromJson(response.data['data']);
    return global;
  }
}
