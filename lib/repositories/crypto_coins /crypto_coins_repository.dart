import 'package:dio/dio.dart';
import 'models/crypto_coin.dart';


class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,TON,BNB&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataList = data.entries.map((e) => CryptoCoin(
        name: e.key,
        priceInUSD: (e.value as Map<String, dynamic>)['USD']
    )).toList();
    print(dataList);
    return dataList;
  }
}