import 'package:flutter/material.dart';

import '/presentation/ui/theme/design_system.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashScreen({
    Key? key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.primaryColor,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
