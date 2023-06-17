import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Map<String, dynamic>> yemekListesi = [
    {
      'ad': 'Mercimek Çorbası',
      'fiyat': '37 TL',
      'aciklama':
          'Lezzetin, sağlığın ve besleyici bir öğünün bir araya geldiği Türk mutfağının vazgeçilmezlerinden biri olan mercimek çorbası, sofralara hem sıcaklık hem de tat katıyor. Bu eşsiz lezzet, yüzlerce yıllık geçmişiyle Anadolu\'nun en köklü tariflerinden biridir.',
      'resim': 'assets/corba2.jpg',
    },
    {
      'ad': 'Baklava',
      'fiyat': '240 TL',
      'aciklama':
          'Bizim baklavalarımız, özenle seçilen en kaliteli malzemelerle ve ustalıkla hazırlanır. Taze tereyağı, dışarıdan temin edilen taptaze çekilmiş cevizler veya fıstıklar, özenle hazırlanan şerbet ve özel olarak inceltilmiş hamurlarla yapılır. Geleneksel yöntemlerle üretim yaparak, tüm detaylara özen gösterir ve baklavanın lezzetini koruruz.',
      'resim': 'assets/baklava2.jpg',
    },
    {
      'ad': 'Kebap',
      'fiyat': '190 TL',
      'aciklama':
          'Türk mutfağının en meşhur ve sevilen lezzetlerinden biri olan kebap...',
      'resim': 'assets/kebab2.jpg',
    },
    {
      'ad': 'Kurufasulye',
      'fiyat': '64 TL',
      'aciklama':
          'Türk mutfağının en sevilen ve geleneksel yemeklerinden biri olan kuru fasulye...',
      'resim': 'assets/kurrs2.jpg',
    },
  ];

  Future<void> sepeteEkle(int index) async {
    try {
      final yemek = yemekListesi[index];
      await FirebaseFirestore.instance
          .collection('Sepet')
          .doc('sepette_$index')
          .set({
        'yemek': yemek['ad'],
        'fiyat': yemek['fiyat'],
        'aciklama': yemek['aciklama'],
        'resim': yemek['resim'],
      });
      print('${yemek['ad']} sepete eklendi.');
    } catch (e) {
      print('Hata: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: const Text('Yemekcii Türk Yemekleri'),
        // App Bar başlığı
      ),
      // Set the background color here
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/corba2.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Mercimek Çorbası",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "37 TL",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "-Lezzetin, sağlığın ve besleyici bir öğünün bir araya geldiği Türk mutfağının vazgeçilmezlerinden biri olan mercimek çorbası, sofralara hem sıcaklık hem de tat katıyor. Bu eşsiz lezzet, yüzlerce yıllık geçmişiyle Anadolu'nun en \n                            köklü tariflerinden biridir.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () =>
                          sepeteEkle(0), // Mercimek Çorbası için indeks 0
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/baklava2.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Baklava",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "240 TL ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "-Bizim baklavalarımız, özenle seçilen en kaliteli malzemelerle ve ustalıkla hazırlanır. Taze tereyağı, dışarıdan temin edilen taptaze çekilmiş cevizler veya fıstıklar, özenle hazırlanan şerbet ve özel olarak inceltilmiş hamurlarla yapılır. Geleneksel yöntemlerle üretim yaparak, tüm detaylara özen gösterir ve baklavanın lezzetini koruruz.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(1),
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kebab2.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Kebap",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "190 TL ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "-Türk mutfağının en meşhur ve sevilen lezzetlerinden biri olan kebap, etin muhteşem aroması ve baharatlarla buluştuğu nefis bir yemektir. Biz, en özenli şekilde hazırlanan ve lezzetini koruyan kebapları sunarak damaklarınıza unutulmaz bir lezzet deneyimi yaşatmayı hedefliyoruz.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(2),
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kurrs2.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Kurufasulye",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "64 TL ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "-Türk mutfağının en sevilen ve geleneksel yemeklerinden biri olan kuru fasulye, doyurucu ve lezzetli bir seçenektir. Biz, en kaliteli ve doğal malzemelerle hazırladığımız kuru fasulyeyi sofralarınıza sunarak sizlere unutulmaz bir lezzet deneyimi yaşatmayı hedefliyoruz.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(3),
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
