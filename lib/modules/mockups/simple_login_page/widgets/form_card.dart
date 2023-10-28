import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  const FormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0.1, 0.1),
                    spreadRadius: 0.1,
                    blurRadius: 10.1)
              ],
              borderRadius: BorderRadius.circular(8.5)),
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: const [
            Text(
              'LOGIN',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 0.60)),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'EMAIL',
                style: TextStyle(
                  color: Color.fromRGBO(20, 110, 231, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            TextField(),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PASSWORD',
                style: TextStyle(
                  color: Color.fromRGBO(20, 110, 231, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            TextField(
              obscureText: true,
            ),
            SizedBox(
              height: 60,
            )
          ]),
        ),
        Positioned(
            bottom: -72,
            left: 40,
            right: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(20, 110, 231, 1),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(20, 110, 231, 0.4),
                          offset: Offset(0.5, 0.5),
                          spreadRadius: 2.8,
                          blurRadius: 20.1)
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('FORGOT PASSWORD?')
              ],
            ))
      ],
    );
  }
}
