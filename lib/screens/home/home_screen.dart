 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/custom_app_bar.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Website> _websites = [
      Website('شئون الطلاب', 'https://fcaisys.fayoum.edu.eg', "assets/images/students.jfif"),
      Website('الارشيف الالكتروني', 'https://www.google.com', "assets/images/archive.jpg"),
      Website('خدمات الدراسات العليا', 'https://fcipost.fayoum.edu.eg', "assets/images/master.jfif"),
      Website('رعاية الشباب', 'https://www.google.com', "assets/images/care.png"),
      Website('ادارة المحتوي', 'https://www.google.com', "assets/images/cms.webp"),
      Website('  الدكتور', 'https://www.google.com', "assets/images/splash.png"),

      // Add more websites here
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppBarWidge(
                imagePath: "assets/images/logo.png",
                nameUser: "كليه الحاسبات والذكاء الاصطناعي",
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      final url = _websites[index].url;
                      try {
                        await launch(url);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Could not launch $url')),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(_websites[index].imageUrl),
                            radius: 30, // You can adjust the size of the circle
                          ),
                          title: Text(_websites[index].name),
                        ),
                      ),
                    ),
                  );
                },
                childCount: _websites.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Website {
  final String name;
  final String url;
  final String imageUrl;

  Website(this.name, this.url, this.imageUrl);
}
