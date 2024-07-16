import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic> ticket;
  final bool? isColor;
  const TicketView({Key?key,required this.ticket, this.isColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: GetPlatform.isAndroid==true?174:169,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            /*
            * container for showing blue card
            * */
            Container(
              decoration:  BoxDecoration(
                color: isColor == null? Color(0xFF526799):Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),
                    topRight: Radius.circular(21)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'],
                          style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white):Styles.headlineStyle3),
                      Expanded(child: Container()),
                      ThickContainer(isColor:true),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: LayoutBuilder(

                              builder: (BuildContext context, BoxConstraints constraints) {
                                print("THe widget is ${constraints.constrainWidth()}");
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                                    width:3 ,height:1 , child: DecoratedBox(decoration: BoxDecoration(
                                      color: isColor==null? Colors.white:Colors.grey.shade300
                                  ),),
                                  )),
                                );
                              },

                            ),
                          ),
                          Center(child: Transform.rotate(angle: 1.5 ,child: Icon(Icons.local_airport_rounded,color: isColor==null? Colors.white:Color(0xFF8ACCF7),),)),
                        ],
                      )),
                      ThickContainer(isColor:true),
                      Expanded(child: Container()),
                      Text(ticket['to']['code'],style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white,):Styles.headlineStyle3)
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      SizedBox(width: 100,child: Text(ticket['from']['name'],style:isColor==null?
                      Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4),
                      ),
                      Text(ticket['flying_time'],style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white,):Styles.headlineStyle4),
                      SizedBox(width: 100,child: Text(ticket['to']['name'], textAlign: TextAlign.end,
                        style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*
            * container for showing red card
            * */
            Container(
              color: isColor==null? Styles.orangeColor:Colors.white,//const Color(0xFFF37B67),
              child: Row(
                children: [
                   SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor==null? Colors.grey.shade200:Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))
                      ),
                    ),
                  ),
                  const Expanded(child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: AppLayoutBuilderWidget(sections: 6,),
                  )),
                   SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor==null? Colors.grey.shade200:Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*
            * container for showing bottom red card
            * */
            Container(
              decoration: BoxDecoration(
                color: isColor==null? Styles.orangeColor:Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(isColor==null?21:0),
                    bottomRight: Radius.circular(isColor==null?21:0)),
              ),
              padding: const EdgeInsets.only(left: 16,top: 5,right: 16,bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firstText: ticket['date'],
                          secondText: "Date",
                          alignment: CrossAxisAlignment.start, isColor: isColor,),

                      AppColumnLayout(firstText: ticket['departure_time'],
                        secondText: "Departure Time",
                        alignment: CrossAxisAlignment.center, isColor: isColor,),

                      AppColumnLayout(firstText: ticket['number'].toString(),
                        secondText: "Number",
                        alignment: CrossAxisAlignment.end, isColor: isColor,),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
    }
  }
