import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Homeheadershimmer extends StatelessWidget {
  const Homeheadershimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(width: 10),

              Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  )
              ),
            ],
          ),

          SizedBox(height: 20),
          
          Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 300,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              )
          ),

          SizedBox(height: 10),

          Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 300,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              )
          ),

          SizedBox(height: 10),

          Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 300,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              )
          ),

          SizedBox(height: 20),

          Row(
            children: [

              SizedBox(width: 10),

              Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  )
              ),
            ],
          ),

        ],
      ),
    );
  }
}
