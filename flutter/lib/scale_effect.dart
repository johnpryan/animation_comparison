import 'package:flutter/cupertino.dart';

void main() {
  runApp(ScaleEffectApp());
}

class ScaleEffectApp extends StatelessWidget {
  ScaleEffectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: ScaleEffectScreen(),
    );
  }
}

class ScaleEffectScreen extends StatelessWidget {
  const ScaleEffectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: MyAnimatedButton(),
      ),
    );
  }
}

class MyAnimatedButton extends StatefulWidget {
  const MyAnimatedButton({super.key});

  @override
  State<MyAnimatedButton> createState() => _MyAnimatedButtonState();
}

class _MyAnimatedButtonState extends State<MyAnimatedButton> {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: CupertinoButton(
        onPressed: () {
          setState(() {
            scale += 1;
          });
        },
        child: const Text("Press here"),
      ),
    );
  }
}