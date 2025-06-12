import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:mini_mart/ui/styles.dart';
import 'package:mini_mart/models/product.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(84),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xffE2E8F0), width: 1.0),
            ),
          ),
          padding: EdgeInsets.only(left: 16, right: 16, top: 44, bottom: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(color: logoBackgroundColor),
                    height: 28,
                    width: 56,
                    child: DottedBorder(
                      color: logoBorderColor,
                      child: Center(
                        child: Text(
                          "Full Logo",
                          style: TextStyle(
                            color: logoBorderColor,
                            fontFamily: 'SFPro',
                            fontSize: 10.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "DELIVERY ADDRESS",
                    style: primaryFont.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Color(0xff334155),
                    ),
                  ),
                  Icon(HugeIcons.strokeRoundedNotification02, size: 24),
                ],
              ),
              Text(
                "Umuezike Road, Oyo State",
                style: primaryFont.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xfff5f5f5), width: 1.0),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ImageIcon(
                      AssetImage("assets/images/back-arrow.png"),
                      size: 24,
                      color: Color(0xff64748b),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Go back",
                    style: primaryFont.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          widget.product.image,
                          width: 334,
                          height: 331.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              HugeIcons.strokeRoundedFavourite,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.product.name,
                    softWrap: true,
                    style: primaryFont.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.product.price,
                    style: primaryFont.copyWith(
                      fontSize: 32.75,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this item",
                    style: primaryFont.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff999999),
                    ),
                  ),
                  Text(
                    widget.product.description ?? "No description available.",
                    style: primaryFont.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff999999),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        height: 94,
        color: Colors.white,
        child: Center(
          child: SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final product = {
                  'image': widget.product.image,
                  'name': widget.product.name,
                  'price': widget.product.price,
                  'quantity': 1,
                };

                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addToCart(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: EdgeInsets.zero,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    content: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(color: Color(0xff10b981), width: 4),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: ImageIcon(
                              AssetImage("assets/images/check-circle.png"),
                              size: 24,
                              color: Color(0xff10b981),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Item has been added to cart",

                              style: TextStyle(
                                color: Color(0xff334155),
                                fontSize: 14,
                                fontFamily: 'SFPro',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: "x",

                      textColor: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  "Add to cart",
                  style: primaryFont.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
