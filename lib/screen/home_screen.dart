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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'U & I',
              style: textTheme.displayLarge,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '우리 처음 만난 날',
                  style: textTheme.displayMedium,
                ),
                Text(
                  "${_dateTime.day}.${_dateTime.month}.${_dateTime.year}",
                  style: textTheme.displaySmall,
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
              style: textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
