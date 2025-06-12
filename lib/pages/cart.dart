<<<<<<< HEAD
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:mini_mart/ui/styles.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
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
                    "Your Cart",
                    style: primaryFont.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  cartProvider.cartItems.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty!",
                            style: TextStyle(
                              fontFamily: 'SFPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartProvider.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartProvider.cartItems[index];
                            double parsedPrice =
                                double.tryParse(
                                  item['price'].replaceAll(
                                    RegExp(r'[^\d.]'),
                                    '',
                                  ),
                                ) ??
                                0.0;

                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xfff6f5f8),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 103,
                                    height: 107,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(item['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color(0xff334155),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "\$${parsedPrice.toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Color(0xff334155),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "In Stock",
                                          style: TextStyle(
                                            fontFamily: 'SFPro',
                                            color: Color(0xff10b981),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => cartProvider
                                                  .updateQuantity(index, false),
                                              child: Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffe2e8f0),
                                                  border: Border.all(
                                                    color: Color(0xffe2e8f0),
                                                  ),
                                                ),
                                                child: Icon(
                                                  HugeIcons
                                                      .strokeRoundedMinusSign,
                                                  color: Color(0xff64748B),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              item['quantity'].toString(),
                                              style: TextStyle(
                                                fontFamily: 'SFPro',
                                                fontSize: 12,
                                                color: Color(0xff334155),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            GestureDetector(
                                              onTap: () => cartProvider
                                                  .updateQuantity(index, true),
                                              child: Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(0xffe2e8f0),
                                                  ),
                                                ),

                                                child: Icon(
                                                  HugeIcons.strokeRoundedAdd01,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () => cartProvider
                                                  .removeFromCart(index),
                                              child: Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(0xffe2e8f0),
                                                  ),
                                                ),
                                                child: Icon(
                                                  HugeIcons
                                                      .strokeRoundedDelete02,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: cartProvider.cartItems.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Info",
                          style: primaryFont.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal:",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$${cartProvider.getTotalPrice().toStringAsFixed(2)}",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping:",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$10.00",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$${(cartProvider.getTotalPrice() + 10).toStringAsFixed(2)}",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: cartProvider.cartItems.isNotEmpty,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
          height: 94,
          child: Center(
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    "Checkout (\$${(cartProvider.getTotalPrice() + 10).toStringAsFixed(2)})",
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
      ),
    );
  }
}
=======
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:mini_mart/ui/styles.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
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
                    "Your Cart",
                    style: primaryFont.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  cartProvider.cartItems.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty!",
                            style: TextStyle(
                              fontFamily: 'SFPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartProvider.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartProvider.cartItems[index];
                            double parsedPrice =
                                double.tryParse(
                                  item['price'].replaceAll(
                                    RegExp(r'[^\d.]'),
                                    '',
                                  ),
                                ) ??
                                0.0;

                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xfff6f5f8),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 103,
                                    height: 107,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(item['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color(0xff334155),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "\$${parsedPrice.toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Color(0xff334155),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "In Stock",
                                          style: TextStyle(
                                            fontFamily: 'SFPro',
                                            color: Color(0xff10b981),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => cartProvider
                                                  .updateQuantity(index, false),
                                              child: Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffe2e8f0),
                                                  border: Border.all(
                                                    color: Color(0xffe2e8f0),
                                                  ),
                                                ),
                                                child: Icon(
                                                  HugeIcons
                                                      .strokeRoundedMinusSign,
                                                  color: Color(0xff64748B),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              item['quantity'].toString(),
                                              style: TextStyle(
                                                fontFamily: 'SFPro',
                                                fontSize: 12,
                                                color: Color(0xff334155),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            GestureDetector(
                                              onTap: () => cartProvider
                                                  .updateQuantity(index, true),
                                              child: Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(0xffe2e8f0),
                                                  ),
                                                ),

                                                child: Icon(
                                                  HugeIcons.strokeRoundedAdd01,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () => cartProvider
                                                  .removeFromCart(index),
                                              child: Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(0xffe2e8f0),
                                                  ),
                                                ),
                                                child: Icon(
                                                  HugeIcons
                                                      .strokeRoundedDelete02,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: cartProvider.cartItems.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Info",
                          style: primaryFont.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal:",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$${cartProvider.getTotalPrice().toStringAsFixed(2)}",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping:",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$10.00",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$${(cartProvider.getTotalPrice() + 10).toStringAsFixed(2)}",
                              style: primaryFont.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: cartProvider.cartItems.isNotEmpty,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
          height: 94,
          child: Center(
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    "Checkout (\$${(cartProvider.getTotalPrice() + 10).toStringAsFixed(2)})",
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
      ),
    );
  }
}
>>>>>>> 1d5fc2a46396b33a6adf5fe52a1d03cc90ebc3dc
