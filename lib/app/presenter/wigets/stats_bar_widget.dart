// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final int currentValue;
  final Color color;
  const StatsBar({
    Key? key,
    required this.currentValue,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          SizedBox(width: 32, child: Text(currentValue.toString())),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: LinearProgressIndicator(
              value: currentValue / 200,
              backgroundColor: color.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
