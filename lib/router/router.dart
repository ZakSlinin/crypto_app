import 'package:crypto_app/features/coin_page/coin.dart';
import 'package:crypto_app/features/home_page/home.dart';

final routes = {
  '/': (context) => const CryptoHomePage(),
  '/coin': (context) => const CoinPage(),
};