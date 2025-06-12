import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mart/pages/cart.dart';
import 'package:mini_mart/pages/product_details.dart';
import 'package:mini_mart/providers/cart_provider.dart';
import 'package:mini_mart/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mini_mart/models/product.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var slideTween = Tween(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        var fadeTween = Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return FadeTransition(
          opacity: animation.drive(fadeTween),
          child: SlideTransition(
            position: animation.drive(slideTween),
            child: child,
          ),
        );
      },
    );
  }

  int selectedIndex = 0;
  List<Widget> screens = [
    Homepage(),
    Cart(),
    Container(), // Placeholder for Favourites
    Container(), // Placeholder for Profile
  ];

  BottomNavigationBarItem _navItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                height: 32,
                width: 56,
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 4),
            ],
          ),

          if (index == 1)
            Positioned(
              right: 5,
              top: -4,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return cartProvider.cartItems.isNotEmpty
                      ? Container(
                          height: 25,
                          width: 25,
                          padding: EdgeInsets.only(
                            top: 3,
                            right: 9,
                            bottom: 3,
                            left: 9,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff3c4856),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              cartProvider.cartItems.length.toString(),
                              style: primaryFont.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink();
                },
              ),
            ),
        ],
      ),
      label: label,
    );
  }

  TextEditingController searchController = TextEditingController();
  List<Product> filteredProducts = [];
  final FocusNode searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    filteredProducts = productList;

    searchController.addListener(() {
      setState(() {
        String query = searchController.text.toLowerCase();
        filteredProducts = productList.where((product) {
          return product.name.toLowerCase().contains(query);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(128),
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
              SizedBox(height: 2),
              Text(
                "Umuezike Road, Oyo State",

                style: primaryFont.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 36,
                child: TextField(
                  focusNode: searchFocusNode,
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      gapPadding: 8,
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color(0xffe2e8f0),
                        width: 1,
                      ),
                    ),
                    hintText: 'Search...',
                    hintStyle: primaryFont.copyWith(
                      fontSize: 14,
                      color: Color(0xffcbd5e1),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff94a3b8),
                      size: 12,
                    ),
                  ),
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
                  ImageIcon(
                    AssetImage("assets/images/back-arrow.png"),
                    size: 24,
                    color: Color(0xff64748b),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Technology",
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
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Smartphones, Laptops & Assecories",
                softWrap: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.ibmPlexMono(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).push(_createRoute(ProductDetails(product: product)));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            product.image,
                            width: 162,
                            height: 162,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: primaryFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            product.price,
                            style: primaryFont.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          items: [
            _navItem(HugeIcons.strokeRoundedHome07, "Home", 0),
            _navItem(HugeIcons.strokeRoundedShoppingCart01, "Cart", 1),
            _navItem(HugeIcons.strokeRoundedFavourite, "Favourites", 2),
            _navItem(HugeIcons.strokeRoundedUserCircle, "Profile", 3),
          ],
          unselectedLabelStyle: primaryFont.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          selectedLabelStyle: primaryFont.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            if (index == 2 || index == 3) {
              searchFocusNode.unfocus();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Feature coming soon!"),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              setState(() {
                selectedIndex = index;
              });

              if (index == 1) {
                searchFocusNode.unfocus();
                Navigator.push(context, _createRoute(Cart())).then((_) {
                  if (mounted) {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }
                });
              }
            }
          },
        ),
      ),
    );
  }
}
