import 'package:college_project/models/product_model.dart';
import 'package:college_project/models/watchlist_model.dart';
import 'package:college_project/screens/product/views/components/products_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:college_project/components/cart_button.dart';
import 'package:college_project/components/custom_modal_bottom_sheet.dart';
import 'package:college_project/components/product/product_card.dart';
import 'package:college_project/constants.dart';
import 'package:college_project/screens/product/views/product_returns_screen.dart';
import 'package:get/get.dart';
import 'components/notify_me_card.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';
import 'components/product_list_tile.dart';
import '../../../components/review_card.dart';
import 'product_buy_now_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    this.isProductAvailable = true,
    this.index,
  });

  final bool isProductAvailable;
  final int? index;

  @override
  Widget build(BuildContext context) {
    RxBool isCardAdded = false.obs;
    return Scaffold(
      bottomNavigationBar:
          isProductAvailable
              ? CartButton(
                price: 140,
                press: () {
                  customModalBottomSheet(
                    context,
                    height: MediaQuery.of(context).size.height * 0.92,
                    child: const ProductBuyNowScreen(),
                  );
                },
              )
              :
              /// If profuct is not available then show [NotifyMeCard]
              NotifyMeCard(isNotify: false, onChanged: (value) {}),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {
                    isCardAdded.value == true;
                    // add data in list
                    watchlistList.add(
                      WatchlistModel(
                        image: demoPopularProducts[index!].image,
                        brandName: demoPopularProducts[index!].brandName,
                        title: demoPopularProducts[index!].title,
                        price: demoPopularProducts[index!].price,
                      ),
                    );
                  },
                  icon: Obx(
                    () => SvgPicture.asset(
                      "assets/icons/Bookmark.svg",
                      color:
                          isCardAdded.value
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
              ],
            ),
            const ProductImages(
              images: [productDemoImg1, productDemoImg2, productDemoImg3],
            ),
            ProductInfo(
              brand: "LIPSY LONDON",
              title: "Sleeveless Ruffle",
              isAvailable: isProductAvailable,
              description:
                  "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
              rating: 4.4,
              numOfReviews: 126,
            ),
            ProductListTile(
              svgSrc: "assets/icons/Product.svg",
              title: "Product Details",
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: ProductDetailsContent(),
                );
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Delivery.svg",
              title: "Shipping Information",
              press: null,

              // i made this nullable productlisttile because page is not ready

              //  () {
              //   customModalBottomSheet(
              //     context,
              //     height: MediaQuery.of(context).size.height * 0.92,
              //     // child: Text('saurav'),

              //     child: const BuyFullKit(
              //       images: ["assets/screens/Shipping information.png"],
              //     ),
              //   );
              // },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Returns",
              isShowBottomBorder: true,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const ProductReturnsScreen(),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: 4.3,
                  numOfReviews: 128,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reviews",
              isShowBottomBorder: true,
              press: null,
              // () {
              //   Navigator.pushNamed(context, productReviewsScreenRoute);
              // },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(
                          left: defaultPadding,
                          right: index == 4 ? defaultPadding : 0,
                        ),
                        child: ProductCard(
                          image: productDemoImg2,
                          title: "Sleeveless Tiered Dobby Swing Dress",
                          brandName: "LIPSY LONDON",
                          price: 24.65,
                          priceAfetDiscount: index.isEven ? 20.99 : null,
                          dicountpercent: index.isEven ? 25 : null,
                          press: () {},
                        ),
                      ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: defaultPadding)),
          ],
        ),
      ),
    );
  }
}
