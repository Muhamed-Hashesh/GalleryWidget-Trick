import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/items_list.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: options.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> option = entry.value;
              return Expanded(
                flex: activeIndex == index ? 4 : 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(activeIndex == index ? 40 : 30),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(option['imageUrl']),
                        fit: BoxFit.cover,
                        // colorFilter: activeIndex != index
                        //     ? ColorFilter.mode(
                        //         Colors.black.withOpacity(0.4),
                        //         BlendMode.darken,
                        //       )
                        //     : null,
                      ),
                      // boxShadow: activeIndex == index
                      //     ? [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.5),
                      //           blurRadius: 15,
                      //           spreadRadius: -10,
                      //           offset: const Offset(0, 10),
                      //         ),
                      //       ]
                      //     : [],
                    ),
                    child: Stack(
                      children: [
                        if (activeIndex == index)
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  option['icon'],
                                  size: 40,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  option['label'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
