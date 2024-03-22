import 'package:flutter/material.dart';

class ScrollableNews extends StatelessWidget {
  const ScrollableNews({
    required this.imagePath,
    required this.title,
    super.key,
  });

  final String? title;
  final String? imagePath;

//https://i.ibb.co/Syx69Xw/Vidimage.png

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.09),
              offset: Offset(0, 1),
              blurRadius: 20,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 155,
                  height: 254,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.04),
                        offset: Offset(0, 22),
                        blurRadius: 69,
                      ),
                    ],
                    image: imagePath == null || imagePath!.isEmpty
                        ? const DecorationImage(
                            image: NetworkImage(
                                "https://www.legrand.co.id/modules/custom/legrand_ecat/assets/img/no-image.png"))
                        : DecorationImage(
                            image: NetworkImage(imagePath!),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        width: 127,
                        child: Text(
                          title ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Helvetica',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
