import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  // activeIndex håller reda på vilken bild som är aktiv för tillfället
  int activeIndex = 0;

  // Läs listan från databasen här
  final List<String> urlImages = [
    "https://via.placeholder.com/400",
    "https://via.placeholder.com/400/0000FF",
    "https://via.placeholder.com/400/FF0000",
    "https://via.placeholder.com/400/00FF00",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // Det är denna metod som skapar image slider
          CarouselSlider.builder(
            // Antalet bilder som ska visas
            itemCount: urlImages.length,
            // Skapar bilden genom att hämta bildens URL
            itemBuilder: (context, index, realIndex) {
              return buildImage(urlImages[index], index);
            },
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              // Denna metod kallas varje gång en bild byts ut i karusellen,
              // därför använder vi setState. Den uppdaterar den aktuella bilden
              // genom att ändra activeIndex
              onPageChanged: (index, reason) {
                setState(() {
                  // index är den nya bildens index. Det börjar på 0 för första
                  // bilden och ökar med 1 varje gång en ny bild visas.
                  activeIndex =
                      index; // Här uppdateras activeIndex med det nya indexet
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(urlImage, fit: BoxFit.cover),
    );
  }
}

/*
 * Felet "Cannot hit test a render box that has never been laid out" uppstår 
 * oftast när du försöker interagera med en widget (som en bildkarusell eller 
 * någon annan widget) innan den har fått en giltig layout, vilket vanligtvis 
 * beror på att den omgivande layouten inte har fått tillräckligt med utrymme 
 * att renderas korrekt.

 * I detta fall kan problemet bero på att din ImageSlider-widget använder en Scaffold 
 * i sig själv, medan den redan är inuti en annan Scaffold i HomeScreen. Det kan skapa 
 * en konflikt eftersom en Scaffold redan hanterar layout och renderingslogik. Därför 
 * bör ImageSlider inte ha en egen Scaffold, utan istället vara en vanlig widget som 
 * renderar sina komponenter.

 * Lösning: Ta bort Scaffold från ImageSlider
 * För att lösa problemet kan du helt enkelt ta bort Scaffold från ImageSlider och 
 * låta den endast rendera sin bildkarusell och indikator.
*/
