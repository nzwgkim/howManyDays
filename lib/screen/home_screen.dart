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

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'U & I',
              style: TextStyle(
                  fontSize: 80, fontFamily: 'parisienne', color: Colors.white),
            ),
            Column(
              children: const [
                Text(
                  '우리 처음 만난 날',
                  style: TextStyle(
                      fontFamily: 'sunflower',
                      fontSize: 30,
                      color: Colors.white),
                ),
                Text(
                  '2021.10.21',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 50,
            ),
            const Text(
              'D+1',
              style: TextStyle(
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
