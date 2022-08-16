import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageRow extends StatelessWidget {
  final String rating;
  final String description;

  const HomePageRow({Key? key, required this.rating, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(8),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/common.png',
              width: 12,
              height: 12,
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ))),
          Text(
            rating,
            style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
