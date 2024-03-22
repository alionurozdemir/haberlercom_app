import 'package:flutter/material.dart';

class HeadlineNews extends StatelessWidget {
  const HeadlineNews({
    required this.title,
    required this.imagePath,
    super.key,
  });

  final String? title;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                image: imagePath == null || imagePath!.isEmpty
                    ? const DecorationImage(
                        image: NetworkImage(
                            "https://www.legrand.co.id/modules/custom/legrand_ecat/assets/img/no-image.png"))
                    : DecorationImage(
                        image: NetworkImage(imagePath!),
                        fit: BoxFit.fitWidth,
                      ),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Colors.white, // Kırmızı renk
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? "Metin Bulunamadı",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Helvetica',
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
