import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6B2C8),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: const [TopPart(), BottomPart()],
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}

class TopPart extends StatefulWidget {
  const TopPart({
    super.key,
  });

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  DateTime _dateTime = DateTime.now();
  DateTime now = DateTime.now();
  String isAfter = '+';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'U & I',
              style: TextStyle(
                  fontSize: 80, fontFamily: 'parisienne', color: Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '우리 처음 만난 날',
                  style: TextStyle(
                      fontFamily: 'sunflower',
                      fontSize: 30,
                      color: Colors.white),
                ),
                Text(
                  "${_dateTime.day}.${_dateTime.month}.${_dateTime.year}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showCupertinoDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.yellow,
                          height: 300,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (value) {
                              setState(() {
                                _dateTime = value;
                                if (now.isAfter(_dateTime)) {
                                  isAfter = '+';
                                } else {
                                  isAfter = '-';
                                }
                                print(now.difference(_dateTime).inDays);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 60,
                )),
            Text(
              'D$isAfter${now.difference(_dateTime).inDays.abs()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: 'sunflower',
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
