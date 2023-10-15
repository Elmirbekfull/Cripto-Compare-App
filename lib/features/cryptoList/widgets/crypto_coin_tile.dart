import 'package:crypto_coins_list/repositories/cryptoCoins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final them = Theme.of(context);
    return ListTile(
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: them.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceinUSD}\$',
        style: them.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed("/coin", arguments: coin);
      },
    );
  }
}
