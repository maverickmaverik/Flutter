import 'package:flutter/material.dart';

class BromoView extends StatelessWidget {
  const BromoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(50.0),
              child: Image.asset(
                'assets/images/bromoview.jpg',
                width: 850,
                height: 500,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Mount Bromo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'East Java, Indonesia',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconButton(Icons.call, 'CALL', Colors.indigo),
                      _buildIconButton(Icons.near_me, 'ROUTE', Colors.indigo),
                      _buildIconButton(Icons.share, 'SHARE', Colors.indigo),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Gunung Bromo adalah gunung berapi aktif ikonik yang terletak di Jawa Timur, Indonesia, yang terkenal dengan lanskapnya yang menakjubkan dan keindahannya yang mengagumkan. Berada di ketinggian 2.329 meter (7.641 kaki) di atas permukaan laut, gunung ini merupakan bagian dari Pegunungan Tengger yang berada di dalam Taman Nasional Bromo Tengger Semeru. Gunung berapi ini dinamai Brahma, dewa pencipta dalam agama Hindu, yang mencerminkan warisan budaya yang kaya di kawasan ini. Ciri khas Bromo yang paling menonjol adalah latar belakangnya yang seperti dunia lain di tengah-tengah "Lautan Pasir" yang luas, sebuah dataran luas berisi abu vulkanik halus yang mengelilingi gunung berapi. Medan yang unik ini, ditambah dengan kerucut gunung berapi yang berbentuk sempurna yang sering kali dihiasi gumpalan asap dan uap, menciptakan panorama seperti bulan yang menarik ribuan pengunjung setiap tahunnya. ',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
