 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/custom_app_bar.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Website> _websites = [
      Website('شئون الطلاب', 'https://www.google.com', "assets/images/logo.png"),
      Website('جوجل', 'https://www.google.com', "assets/images/logo.png"),
      // أضف مواقع أخرى هنا
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppBarWidge(
              //  title: " ",
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
                     // if (await canLaunch(url)) {
                     try{
                        
                        await launch(url);
                        }
                        catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Could not launch $url')),
                              );
                        }
                           },
                    //  } else {
                       // throw 'Could not launch $url';
                       //ScaffoldMessenger.of(context).showSnackBar(
                       //SnackBar(content: Text('Could not launch $url')),
                              // );
                             //  print(url);
                     // }
                 
                    
                    child: Padding(
                       padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 25) ,
                      child: ListTile(
                        leading: Image.asset(_websites[index].imageUrl),
                        title: Text(_websites[index].name),
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
