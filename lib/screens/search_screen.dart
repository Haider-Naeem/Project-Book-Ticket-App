import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/icon_text_widget.dart';
import 'package:booktickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gap/gap.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../widgets/double _text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          const Gap(40),
          Text("What are\nyou looking for?",style: Styles.headlineStyle1.copyWith(fontSize: 35),),
          const Gap(20),
          const AppTicketTabs(firstTab: 'Airline Tickets', secondTab: 'Hotels',),
          const Gap(25),
          const AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure"),
          const Gap(20),
          const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
          const Gap(25),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xD91130CE),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
                  child: Text("Find Tickets",
                        style: Styles.textStyle.copyWith(color:Colors.white),),
            ),
          ),
          const Gap(40),
          const AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View All"),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 450,
                width: size.width*0.42,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/sit.png"
                          )
                        )
                      ),
                    ),
                    const Gap(12),
                    Text("20% discount on the early booking of this flight.Don't miss.",
                    style: Styles.headlineStyle2,)
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width*0.44,
                        height: 230,
                        decoration: BoxDecoration(
                            color: Color(0xFF3AB8B8),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey",
                              style: Styles.headlineStyle2.copyWith(fontWeight: FontWeight.bold,
                                  color: Colors.white),),
                            const Gap(10),
                            Text("Take the survey about our services and get discount",
                              style: Styles.headlineStyle2.copyWith(fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),),

                          ],
                        ),
                      ),
                      Positioned(
                          right:-45,
                          top: -40,
                          child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 18,color: Color(0xFF189999)),
                            color: Colors.transparent

                        ),
                      ))
                    ],
                  ),
                  const Gap(15),
                  Container(
                    width: size.width*0.44,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFEC6545)
                    ),
                    child: Column(
                      children: [
                        Text("Take Love",
                          style: Styles.headlineStyle2.copyWith(color: Colors.white,
                            fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,),
                        const Gap(5),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '😍',
                                style: TextStyle(fontSize: 25)
                              ),
                              TextSpan(
                                  text: '🥰️',
                                  style: TextStyle(fontSize: 40)
                              ),
                              TextSpan(
                                  text: '😘',
                                  style: TextStyle(fontSize: 25)
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
