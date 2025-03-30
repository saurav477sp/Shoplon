import 'package:college_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color ?? blackColor;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Header with properly centered title
          SizedBox(
            height: 48, // Fixed height for header
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back, size: 25),
                    color: textColor,
                  ),
                ),
                Center(
                  child: Text(
                    'Product details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Story section
          _buildSection(
            context: context,
            title: 'Story',
            content: Text(
              'A cool gray cap in soft corduroy. Watch me.\' By buying cotton products from Lindex, you\'re supporting more responsibly...',
              style: TextStyle(fontSize: 14, color: textColor),
            ),
          ),
          const Divider(height: 40),
          // Details section
          _buildSection(
            context: context,
            title: 'Details',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DetailItem(text: 'Materials: 100% cotton, and lining', color: textColor),
                _DetailItem(text: 'Structured', color: textColor),
                _DetailItem(text: 'Adjustable cotton strap closure', color: textColor),
                _DetailItem(text: 'High quality embroidery stitching', color: textColor),
                _DetailItem(text: 'Head circumference: 21" - 24" / 54 - 62 cm', color: textColor),
                _DetailItem(text: 'Embroidery stitching', color: textColor),
                _DetailItem(text: 'One size fits most', color: textColor),
              ],
            ),
          ),
          const Divider(height: 40),
          // Style Notes section
          _buildSection(
            context: context,
            title: 'Style Notes',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DetailItem(text: 'Style: Summer Hat', color: textColor),
                _DetailItem(text: 'Design: Plain', color: textColor),
                _DetailItem(text: 'Fabric: Jersey', color: textColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content, required BuildContext context}) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color ?? blackColor;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String text;
  final Color color;

  const _DetailItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(color: color)),
          Expanded(child: Text(text, style: TextStyle(color: color))),
        ],
      ),
    );
  }
}