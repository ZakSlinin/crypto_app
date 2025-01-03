import 'package:crypto_app/repositories/crypto_coins%20/crypto_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins%20/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    super.initState();
    _loadCryptoList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'ZK Crypto',
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];
                return HomeCoinsTile(
                  coin: coin,
                );
              }),
    );
  }

  Future<void> _loadCryptoList() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
