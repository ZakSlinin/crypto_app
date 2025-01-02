import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCoinsTile extends StatelessWidget {
  const HomeCoinsTile({
    super.key,
    required this.theme,
    required this.bitcoin,
  });

  final ThemeData theme;
  final String bitcoin;

  @override
  Widget build(BuildContext context) {
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
  }
}