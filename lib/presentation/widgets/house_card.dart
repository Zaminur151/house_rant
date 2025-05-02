import 'package:flutter/material.dart';


class HouseCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String distance;

  const HouseCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 222,
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
               image: DecorationImage(
      image: AssetImage(image),
      fit: BoxFit.fill,
    ),
            ),
),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text(
                    distance,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: LinearGradient(
                  // ignore: deprecated_member_use
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    location,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
