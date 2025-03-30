import 'package:flutter/material.dart';

class SizeGuide extends StatelessWidget {
  const SizeGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        // Size table
        _buildSizeTable(),
        const SizedBox(height: 32),
        // Measurement Guide
        const Text(
          'Measurement Guide',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildMeasurementGuideItem(
          title: 'Bust',
          description:
              'Measure under your arms at the fullest part of your bust. '
              'Be sure to go over your shoulder blades.',
        ),
        const SizedBox(height: 16),
        _buildMeasurementGuideItem(
          title: 'Natural Waist',
          description:
              'Measure around the narrowest part of your waistline with '
              'one forefinger between your body and the measuring tape.',
        ),
      ],
    );
  }

  Widget _buildSizeTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        // 0: FixedColumnWidth(60),
        // 1: FixedColumnWidth(100),
        // 2: FixedColumnWidth(100),
      },
      children: [
        // Header row
        const TableRow(
          decoration: BoxDecoration(color: Colors.grey),
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Size',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Centimeters',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Inches',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // Data rows
        _buildTableRow('XS', '32', '24-25', '34-35'),
        _buildTableRow('S', '34', '26-27', '36-39'),
        _buildTableRow('M', '36', '28-29', '38-39'),
        _buildTableRow('L', '38-40', '31-33', '41-43'),
        _buildTableRow('XL', '42', '34', '44'),
      ],
    );
  }

  TableRow _buildTableRow(
    String size,
    String cmBust,
    String cmWaist,
    String cmHips,
  ) {
    return TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              size,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(cmBust),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(cmWaist),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(cmHips),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(_convertCmToInches(cmBust)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(_convertCmToInches(cmWaist)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(_convertCmToInches(cmHips)),
            ),
          ],
        ),
      ],
    );
  }

  String _convertCmToInches(String cmValue) {
    // This is a simplified conversion - you might want to implement actual conversion logic
    if (cmValue.contains('-')) {
      final parts = cmValue.split('-');
      return '${parts[0]}–${parts[1]}';
    }
    return cmValue;
  }

  Widget _buildMeasurementGuideItem({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(description, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
