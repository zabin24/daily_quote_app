import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const DailyQuoteApp());
}

class DailyQuoteApp extends StatelessWidget {
  const DailyQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Young Sheldon Quotes',
      theme: ThemeData(fontFamily: 'Georgia', primarySwatch: Colors.indigo),
      home: const QuoteScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<String> quotes = [
    "When you're a kid, everything feels like the end of the world. But it's not.",
    "The world is full of dumb people. I try not to be one of them.",
    "Sometimes, the best way to learn is to make a mistake.",
    "People don’t like to be corrected. Even when they’re wrong.",
    "If you’re gonna do something wrong, do it right.",
    "It’s not bragging if it’s true.",
    "Being smart isn’t a license to be a jerk.",
    "Not everything can be explained with science.",
    "Having a high IQ doesn’t mean you have common sense.",
    "Sometimes growing up means accepting what you can’t control.",
  ];

  int currentIndex = 0;

  void showNextQuote() {
    setState(() {
      currentIndex = (currentIndex + 1) % quotes.length;
    });
  }

  void copyQuote() {
    Clipboard.setData(ClipboardData(text: quotes[currentIndex]));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Quote copied to clipboard!")));
  }

  void shareQuote() {
    Share.share(quotes[currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Young Sheldon Quotes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 35, 103, 128),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/sheldon.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"${quotes[currentIndex]}"',
                  style: const TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 242, 246, 245),
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: showNextQuote,
                      icon: Icon(Icons.refresh,
                          color: const Color.fromARGB(255, 12, 11, 11)),
                      label: Text("Next"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 35, 103, 128), // Background color
                        foregroundColor: Colors.white, // Text and icon color
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: copyQuote,
                      icon: Icon(Icons.copy,
                          color: const Color.fromARGB(255, 12, 11, 11)),
                      label: Text("Copy"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 35, 103, 128),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: shareQuote,
                      icon: Icon(Icons.share,
                          color: const Color.fromARGB(255, 12, 11, 11)),
                      label: Text("Share"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 35, 103, 128),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
