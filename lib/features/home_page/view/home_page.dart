import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CryptoHomePage extends StatelessWidget {
  const CryptoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const data = ['Bitcoin', 'BNB', 'Toncoin'];
    const bitcoin = 'Bitcoin';
    final theme = Theme.of(context);
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
            return HomeCoinsTile(theme: theme, bitcoin: bitcoin);
          }),
    );
  }
}