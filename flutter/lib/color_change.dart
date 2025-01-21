import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(
    home: WithAnimationExample(),
  ));
}

class WithAnimationExample extends StatefulWidget {
  @override
  _WithAnimationExampleState createState() => _WithAnimationExampleState();
}

class _WithAnimationExampleState extends State<WithAnimationExample> {
  bool isBlue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300), // Animation duration
              curve: Curves.easeInOut, // Animation curve
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: isBlue
                    ? CupertinoColors.systemBlue
                    : CupertinoColors.systemRed,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CupertinoColors.black, width: 3),
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  isBlue = !isBlue;
                });
              },
              child: Text("Toggle Color"),
            ),
          ],
        ),
      ),
    );
  }
}
