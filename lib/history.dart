import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Daftar data history (menggunakan data dari courts)
  final List<Map<String, dynamic>> courts = [
    {
      'title': 'Futsal Court A',
      'location': 'Indoor',
      'surface': 'Air Conditioned',
      'courtprice': 50000,
      'imagePath': 'assets/images/futsal.png',
      'rating': 4.8,
      'createdAt': DateTime.now().subtract(const Duration(days: 5)),
      'status': 'Booked | Paid via QRIS',
    },
    {
      'title': 'Basketball Court B',
      'location': 'Outdoor',
      'surface': 'Premium Flooring',
      'courtprice': 75000,
      'imagePath': 'assets/images/basketball.png',
      'rating': 4.7,
      'createdAt': DateTime.now().subtract(const Duration(days: 10)),
      'status': 'Booked | Paid on Location',
    },
    {
      'title': 'Badminton Court C',
      'location': 'Indoor',
      'surface': 'Wooden Flooring',
      'courtprice': 45000,
      'imagePath': 'assets/images/badminton.png',
      'rating': 4.9,
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
      'status': 'Booked | Paid via QRIS',
    },
    {
      'title': 'Tennis Court D',
      'location': 'Outdoor',
      'surface': 'Hard Surface',
      'courtprice': 80000,
      'imagePath': 'assets/images/tennis.png',
      'rating': 4.6,
      'createdAt': DateTime.now().subtract(const Duration(days: 8)),
      'status': 'Booked | Paid on Location',
    },
    {
      'title': 'Volleyball Court E',
      'location': 'Indoor',
      'surface': 'Synthetic Flooring',
      'courtprice': 60000,
      'imagePath': 'assets/images/volley.png',
      'rating': 4.5,
      'createdAt': DateTime.now().subtract(const Duration(days: 3)),
      'status': 'Booked | Paid via QRIS',
    },
  ];

  // Fungsi format price
  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  // Widget untuk card history
  Widget _buildHistoryCard({
    required String title,
    required String type,
    required int courtprice,
    required String imagePath,
    required double rating,
    required String status,
  }) {
    // Tentukan warna status biar beda tergantung jenisnya
    Color statusColor = status.contains("QRIS")
        ? Colors.green
        : Colors.orange;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 352,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000), // #0000001A
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x1A000000), // #0000001A
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                height: 192,
                width: 352,
                fit: BoxFit.cover,
              ),
            ),

            // Isi card
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 24 / 16,
                          letterSpacing: 0,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              height: 20 / 14,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Type
                  Text(
                    type,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                      height: 20 / 14,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Harga + Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${formatPrice(courtprice)}/hour",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 24 / 16,
                          letterSpacing: 0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: statusColor, width: 1),
                        ),
                        child: Text(
                          status,
                          style: GoogleFonts.poppins(
                            color: statusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 16 / 12,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Booking History",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 28 / 18,
            letterSpacing: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courts.length,
                itemBuilder: (context, index) {
                  final history = courts[index];
                  return _buildHistoryCard(
                    title: history['title'],
                    type: '${history['location']} • ${history['surface']}',
                    courtprice: history['courtprice'],
                    imagePath: history['imagePath'],
                    rating: history['rating'],
                    status: history['status'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}