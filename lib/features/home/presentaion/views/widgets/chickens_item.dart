import 'package:chickens/core/utils/app_colors.dart';
import 'package:chickens/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChickensItem extends StatelessWidget {
  const ChickensItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 163,
      // height: 250,
      decoration: ShapeDecoration(shape: 
      RoundedRectangleBorder(borderRadius:
       BorderRadius.circular(12)),
        color: Color(0xFFF3F5F7)),
        child: Stack(
          children: [ 
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline))),
              Positioned.fill(child: 
              Column(
                children: [
                  Image.asset('assets/images/white chicken1.png',height: 140,),

                  ListTile(
                    title: Text('دجاجة بيضاء',style: AppTextStyles.bold13),
                    
                    subtitle: Text.rich(
                       TextSpan(children: [
                        TextSpan(text: '70 جنية ' , style: AppTextStyles.bold13.copyWith(color: Colors.orange[600])),
                        TextSpan(text: '/  الكيلو ', style: AppTextStyles.bold13.copyWith(color: Colors.orange[300])),
                        
                       ]
                      )
                    ),
                    trailing: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add, color: Colors.white,),
                ),
              ),
                  ),
                ],
              )
              ),
              

          ],
        ),
    );
  }
}