import 'package:flutter/material.dart';
import 'package:solution_challenge/config/assets.dart';

class InternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                Assets.klogo,
                scale: 24,
              ),
            ),
            Expanded(
                flex: 5,
                child: Image.asset(
                  Assets.kSpace,
                  scale: 1,
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'NO INTERNET CONNECTION\n\n',
                      style: TextStyle(fontSize: 25, color: Color(0xff2AA4F4)),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'To serve you the best user experience we need network services to access the realtime  posts & contents',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xff5222D0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Retry",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
