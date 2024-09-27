import 'package:carlease_frontend/models/car.dart';
import 'package:carlease_frontend/screens/car_brands.dart';
import 'package:carlease_frontend/screens/car_details.dart';
import 'package:carlease_frontend/screens/se_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  Future<void> _fetchCars() async {
    final provider = Provider.of<Car>(context, listen: false);
    await provider.getCars();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Car>(context);
    List<int> popularIndex = [0, 1, 2, 3];
    List<int> sportIndex = [3, 4, 5];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zaidan & Zaghlout Cars",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel for featured cars
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: false,
                viewportFraction: 1,
              ),
              items: [
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Cg6yK-dL78uo4KTKqEBzS-5oom3Ot2--3w&s",
                "https://i2-prod.manchestereveningnews.co.uk/incoming/article29775469.ece/ALTERNATES/s1200c/0_GVbL1TKXEAA9OzWjfif.jpg",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_eKeZvPG_p9WKXrzTx-YhfChCdjrI0gNz4NIccFBK2xivW0LkFPKmc-ZpfP0Qwu5qils&usqp=CAU",
                "https://media.drive.com.au/obj/tx_q:50,rs:auto:1920:1080:1/driveau/upload/cms/uploads/g79assef5efe0tcct86b",
              ].map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text("Bild kan inte laddas"));
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 40),

            Text(
              "Populära Bilar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            SizedBox(height: 20),

            provider.lst.isNotEmpty
                ? Show_horisont(matchIndex: popularIndex, provider: provider)
                : Center(child: Text("Inga bilar tillgängliga")),
            SizedBox(height: 60),

            Text(
              "Sport Bilar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            provider.lst.isNotEmpty
                ? Show_horisont(matchIndex: sportIndex, provider: provider)
                : Center(
                    child: Text("Inga bilar är tillgängliga"),
                  ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Explore Our Car Brand",
              style: TextStyle(
                  color: Color(0xD10415F3),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Button(name: "Mercedes"), Button(name: "BMW")],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Button(name: "Kia"), Button(name: "Ford")],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SeAllScreen(provider: provider)));
                },
                child: Text(
                  "Se All",
                  style: TextStyle(color: Color(0xD10415F3)),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFF1E6),
                    minimumSize: Size(430, 40)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String name;
  const Button({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CarBrands(name: name)));
        },
        child: Text(
          name,
          style: TextStyle(fontSize: 15, color: Color(0xD10415F3)),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFF1E6), minimumSize: Size(200, 40)));
  }
}

class Show_horisont extends StatelessWidget {
  const Show_horisont({
    super.key,
    required this.matchIndex,
    required this.provider,
  });

  final List<int> matchIndex;
  final Car provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: matchIndex.length,
            itemBuilder: (context, index) {
              final item = provider.lst[matchIndex[index]];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarDetails(
                                car: item,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 230,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            item.pic[0],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.marke,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.modell,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            item.price.toString() + " kr",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
