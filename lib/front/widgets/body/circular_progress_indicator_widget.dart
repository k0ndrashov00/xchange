import 'package:flutter/material.dart';
import 'package:xchange/front/theme.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * circularProgressIndicatorSize,
        height: MediaQuery.of(context).size.width * circularProgressIndicatorSize,
        child: CircularProgressIndicator(color: circularProgressIndicatorColor),
      ),
    );
  }
}