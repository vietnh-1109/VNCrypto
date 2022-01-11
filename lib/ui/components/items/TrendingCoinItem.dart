import 'package:flutter/material.dart';
import 'package:vn_crypto/data/model/item_trending_coin.dart';
import 'package:vn_crypto/ultils/Constant.dart';

class TrendingCoinItem extends StatefulWidget {
  final ItemTrendingCoin itemCoin;

  const TrendingCoinItem({required this.itemCoin, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TrendingCoinItemState(itemCoin);
}

class TrendingCoinItemState extends State<TrendingCoinItem> {
  final ItemTrendingCoin itemCoin;

  TrendingCoinItemState(this.itemCoin);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: SizedBox(
        width: 128,
        height: 128,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, top: 12, bottom: 12),
                          child: Image.network(
                            itemCoin.thumb,
                            width: 34,
                            height: 34,
                          )),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 47,
                            height: 17,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(188, 185, 185, 1),
                                    borderRadius: BorderRadius.circular(3))),
                          ),
                          Text(
                            "${AppStrings.rankTrendingCoin}${itemCoin.rank.toString()}",
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    itemCoin.name,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "(${itemCoin.symbol})",
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 6),
                  child: Text(
                    "${AppStrings.scoreCoin}${itemCoin.score}",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
