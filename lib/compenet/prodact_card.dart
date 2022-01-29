import 'package:flutter/material.dart';
import 'package:project/constant.dart';
import 'package:like_button/like_button.dart';

class ProdactCard extends StatelessWidget {
  // final FileImage image;
  final String name;
  final String imagUrl;
  final Function() onTap;

  ProdactCard({
    // required this.image,
    required this.name,
    required this.imagUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 20,
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset('$imagUrl'),
                ),
                Positioned(
                    bottom: 8,
                    left: 10,
                    right: 10,
                    child: Container(
                        color: Colors.black54,
                        height: 32,
                        child: Row(
                          children: [
                            Text(
                              '  ' + name,
                              style: TextStyle(color: white),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            LikeButton(
                              likeCount: 3,
                            )
                          ],
                        ))),
              ],
            )),
      ),
    );
  }
}
