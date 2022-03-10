import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jai_kisan/models/item.dart';
import 'package:get/get.dart';
import 'package:jai_kisan/screens/orderScreens/place_order_screen.dart';

class ItemView extends StatelessWidget {
  Item item;
  String phoneNumber;
  ItemView({Key? key, required this.item,required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                      ),),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        const SizedBox(height: 66,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "₹" + item.price.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.description.description,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Brand : ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.description.brand,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Seller : ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.description.seller,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rating : ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        item.description.rating.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.6),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 4,),
                                      const Icon(Icons.star,color: Colors.amber,)
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10,top: MediaQuery.of(context).size.height * 0.045),
              child: InkWell(
                onTap: ()=>Get.back(),
                child: Icon(Icons.arrow_back_sharp,color: Colors.black.withOpacity(0.4),size: 30,),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Get.to(PlaceOrderScreen(item: item,phoneNumber: phoneNumber,)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF1AAD9E),
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:12.0),
                          child: Text("Buy Now",style: GoogleFonts.roboto(color: Colors.black.withOpacity(0.5),fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),),
                        )),

                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Icon(Icons.shopping_cart,color: Colors.black.withOpacity(0.5),size: 22,),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
