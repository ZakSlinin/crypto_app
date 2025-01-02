import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zak crypto app',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(1, 164, 255, 164),
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 25),
        ),
        dividerColor: Colors.white10,
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
      ),
      routes: {
        '/': (context) => CryptoHomePage(),
        '/coin': (context) => CoinPage(),
      },
    );
  }
}

class CryptoHomePage extends StatelessWidget {
  const CryptoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const data = ['Bitcoin', 'BNB', 'Toncoin'];
    const bitcoin = 'Bitcoin';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'ZK Crypto',
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: ListView.separated(
          itemCount: data.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: SvgPicture.asset(
                'assets/svg/bitcoin_logo.svg',
                height: 55,
                width: 55,
              ),
              title: Text('Bitcoin', style: theme.textTheme.bodyMedium),
              subtitle: Text('97000\$'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/coin',
                  arguments: bitcoin,
                );
              },
            );
          }),
    );
  }
}

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is! String) {
      print('You must provide args by string');
      return;
    }

    if (args == null) {
      print('You must provide args');
      return;
    }

    coinName = args;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
