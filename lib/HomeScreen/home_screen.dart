import 'package:flutter/material.dart';
import 'image_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zaidan & Zaghlout Cars"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        // Lägg till SingleChildScrollView för att hantera rullbart innehåll
        child: Column(
          children: [
            // Lägg till ImageSlider längst upp på sidan
            ImageSlider(),
            SizedBox(height: 20), // Mellanrum mellan slider och text
            Center(
              child: Text(
                "Hem-skärm",
                style: TextStyle(fontSize: 24),
              ),
            ),
            // Du kan lägga till mer innehåll här om du vill
          ],
        ),
      ),
    );
  }
}

/*
 * Vad är SingleChildScrollView ?

  För att få din BottomNavigationBar att alltid vara fast längst ner på skärmen, 
  oavsett innehållet i din app, ska du se till att den är inbäddad korrekt i en 
  Scaffold-widget, vilket du redan gör i din kod. BottomNavigationBar kommer 
  automatiskt att vara fixerad längst ner i skärmen om du placerar den korrekt 
  i Scaffold som du har gjort.

  Men om du upplever att BottomNavigationBar rör sig när du bläddrar i innehållet 
  (t.ex. om du har ett rullbart innehåll), kan du följa dessa steg för att säkerställa 
  att den förblir på plats:

  1. Använd en SingleChildScrollView i kroppen
  Om din layout kan vara rullbar (långt innehåll) ska du använda SingleChildScrollView 
  i body-delen för att rulla innehållet, men BottomNavigationBar kommer fortfarande 
  att vara fast längst ner.

  2. Se till att BottomNavigationBar förblir fixerad
  Din nuvarande implementation är korrekt. BottomNavigationBar i Scaffold är
  redan fast längst ner. Om du vill vara säker på att den inte påverkas av rullning 
  kan du anpassa innehållet i din body genom att använda SingleChildScrollView eller 
  Expanded om det behövs.
 * 
 */