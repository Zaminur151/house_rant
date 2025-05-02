import 'package:flutter/material.dart';

class BestHouseTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final int bedrooms;
  final int bathrooms;

  const BestHouseTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.bed_outlined, size: 16,),
                    const SizedBox(width: 4),
                    Text(
                      "$bedrooms Bedroom",
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.bathtub_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "$bathrooms Bathroom",
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
