import 'package:college_project/components/network_image_with_loader.dart';
import 'package:college_project/components/text/BodyText.dart';
import 'package:college_project/constants.dart';
import 'package:college_project/models/watchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review your order'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: watchlistList.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: 16,
                      left: index == 0 ? defaultPadding : 0,
                      right:
                          index == watchlistList.length - 1
                              ? defaultPadding
                              : 0,
                    ),
                    child: _buildProductItem(
                      brand: watchlistList[index].brandName,
                      name: watchlistList[index].title,
                      currentPrice:
                          '\$${watchlistList[index].price.toStringAsFixed(2)}',
                      originalPrice:
                          watchlistList[index].priceAfetDiscount != null
                              ? '\$${watchlistList[index].priceAfetDiscount!.toStringAsFixed(2)}'
                              : null,
                      imageUrl: watchlistList[index].image,
                    ),
                  ),
            ),

            const Divider(thickness: 1, height: 40),

            // Coupon section
            const BodyText(
              text: 'Your Coupon code',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            _buildCouponField(context),
            const Divider(thickness: 1, height: 40),

            // Order summary
            const BodyText(
              text: 'Order Summary',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            _buildSummaryRow('Subtotal', '\$24'),
            _buildSummaryRow('Shipping Fee', 'Free'),
            _buildSummaryRow('Total (Include of VAT)', '\$25'),
            _buildSummaryRow('Estimated VAT', '\$1'),
            const SizedBox(height: 40),

            // Checkout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required String brand,
    required String name,
    required String currentPrice,
    required String? originalPrice,
    required String imageUrl,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image container
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: NetworkImageWithLoader(imageUrl, radius: defaultBorderRadious),
        ),

        // Product details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(brand, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: '$currentPrice ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (originalPrice != null)
                      TextSpan(
                        text: originalPrice,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Delete icon
        IconButton(icon: const Icon(Icons.close, size: 20), onPressed: () {}),
      ],
    );
  }

  Widget _buildCouponField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Type coupon code',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.network(
            'assets/icons/Coupon.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style:
                value == 'Free'
                    ? const TextStyle(color: Colors.green)
                    : const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
