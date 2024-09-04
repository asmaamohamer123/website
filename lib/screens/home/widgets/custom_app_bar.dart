 
import 'package:flutter/material.dart';
import 'package:website/screens/home/widgets/app_colors.dart';

class AppBarWidge extends StatelessWidget {
  const AppBarWidge({
    super.key,
    //required this.title,
    required this.nameUser,
    required this.imagePath,
  });
  ///final String title;
  final String nameUser;
  final String imagePath;
  // final String locationName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 40) ,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .2,
        width: MediaQuery.sizeOf(context).width ,
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 0) ,
        decoration: const BoxDecoration(
          color: AppColors.primaryColorLight,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           // Text(title,
              //  style: Theme.of(context)
                 //   .textTheme
                  //  .headlineLarge!
                  //  .copyWith(color: AppColors.colorWhite)),
            Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(

                  nameUser,
                    
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.colorWhite,
                      fontSize: 20,
                      ),
                      
                  textDirection: TextDirection.rtl,
                  
                ),
              ],
            ),
          ],
        ),
         
      ),
    );
   
  }
}
