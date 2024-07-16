import 'package:barcode_widget/barcode_widget.dart';
import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/layout_builder_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          children: [
            const Gap(40),
            Text("Tickets",style: Styles.headlineStyle1,),
            const Gap(20),
            const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
            const Gap(20),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: TicketView(ticket: ticketList[0],isColor: true,),
            ),
            const SizedBox(height: 1,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              color: Colors.white,
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      AppColumnLayout(firstText: 'Flutter DB',
                        secondText: 'Passenger',
                        alignment: CrossAxisAlignment.start,
                        isColor: false,),

                      AppColumnLayout(firstText: '5221-2131412',
                        secondText: 'Passport',
                        alignment: CrossAxisAlignment.end,
                        isColor: false,),
                    ],
                  ),
                  const Gap(20),
                  const AppLayoutBuilderWidget(sections: 15,isColor:false,width: 5,),
                  const Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      AppColumnLayout(firstText: '5221-18092180',
                        secondText: 'Number of E-Ticket',
                        alignment: CrossAxisAlignment.start,
                        isColor: false,),

                      AppColumnLayout(firstText: 'B25863',
                        secondText: 'Booking Code',
                        alignment: CrossAxisAlignment.end,
                        isColor: false,),
                    ],
                  ),
                  const Gap(20),
                  const AppLayoutBuilderWidget(sections: 15,isColor:false,width: 5,),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/visa.png",scale: 11,),
                              Text(" *** 2468",style: Styles.headlineStyle3,)
                            ],
                            
                          ),
                          Gap(5),
                          Text("Payment Method", style: Styles.headlineStyle4)
                        ],
                      ),
                      const AppColumnLayout(firstText: '\$249.99',
                        secondText: 'Price',
                        alignment: CrossAxisAlignment.end,
                        isColor: false,),

                    ],
                  ),

                ],
              ),
            ),
            /*
            * bar code
            * */
            //const SizedBox(height: 1,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21))
              ),
              margin: EdgeInsets.only(left: 15,right: 15),
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(14),
                  child: BarcodeWidget(data: "https://github.com/martinovov",
                      barcode: Barcode.code128(),
                  drawText: false,
                  color: Styles.textColor,
                  width: double.infinity,
                  height: 70,),
                ),
              ),
            ),
            Gap(20),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: TicketView(ticket: ticketList[0]),
            ),
            
          ],
        ),
          Positioned(
            left: 22,
            top: 295,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor,width: 2)
              ),
              child: CircleAvatar(
                maxRadius:4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: 22,
            top: 295,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor,width: 2)
              ),
              child: CircleAvatar(
                maxRadius:4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
    ]),
    );
  }
}
