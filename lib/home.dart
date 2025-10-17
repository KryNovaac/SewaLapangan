import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/duration.dart';
import 'package:sewa_lapangan/history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // data lapangan
  List<Map<String, dynamic>> courts = [
    {
      'title': 'Futsal Court A',
      'location': 'Indoor',
      'surface': 'Air Conditioned',
      'courtprice': 50000,
      'imagePath': 'assets/images/futsal.png',
      'rating': 4.8,
      'createdAt': DateTime.now().subtract(const Duration(days: 5)),
    },
    {
      'title': 'Basketball Court B',
      'location': 'Outdoor',
      'surface': 'Premium Flooring',
      'courtprice': 75000,
      'imagePath': 'assets/images/basketball.png',
      'rating': 4.7,
      'createdAt': DateTime.now().subtract(const Duration(days: 10)),
    },
    {
      'title': 'Badminton Court C',
      'location': 'Indoor',
      'surface': 'Wooden Flooring',
      'courtprice': 45000,
      'imagePath': 'assets/images/badminton.png',
      'rating': 4.9,
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'title': 'Tennis Court D',
      'location': 'Outdoor',
      'surface': 'Hard Surface',
      'courtprice': 80000,
      'imagePath': 'assets/images/tennis.png',
      'rating': 4.6,
      'createdAt': DateTime.now().subtract(const Duration(days: 8)),
    },
    {
      'title': 'Volleyball Court E',
      'location': 'Indoor',
      'surface': 'Synthetic Flooring',
      'courtprice': 60000,
      'imagePath': 'assets/images/volley.png',
      'rating': 4.5,
      'createdAt': DateTime.now().subtract(const Duration(days: 3)),
    },
  ];

  // state untuk filter dan pencarian
  String _filter = 'Terbaru';
  String _searchQuery = '';
  String? _selectedLocation;

  // format price
  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  // urut & filter
  List<Map<String, dynamic>> getFilteredCourts() {
    List<Map<String, dynamic>> filteredCourts = List.from(courts);

    // filter pencarian
    if (_searchQuery.isNotEmpty) {
      filteredCourts = filteredCourts.where((court) {
        return court['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
               court['location'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
               court['surface'].toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // filter lokasi
    if (_selectedLocation != null && _selectedLocation != 'All') {
      filteredCourts = filteredCourts.where((court) => court['location'] == _selectedLocation).toList();
    }

    // filter urut
    switch (_filter) {
      case 'Terbaru':
        filteredCourts.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));
        break;
      case 'Lama':
        filteredCourts.sort((a, b) => a['createdAt'].compareTo(b['createdAt']));
        break;
      case 'Termurah':
        filteredCourts.sort((a, b) => a['courtprice'].compareTo(b['courtprice']));
        break;
      case 'Termahal':
        filteredCourts.sort((a, b) => b['courtprice'].compareTo(a['courtprice']));
        break;
      case 'Berdasarkan Bintang':
        filteredCourts.sort((a, b) => b['rating'].compareTo(a['rating']));
        break;
    }

    return filteredCourts;
  }

  // Widget untuk card lapangan
  Widget _buildFieldRent({
    required String title,
    required String location,
    required String surface,
    required int courtprice,
    required String imagePath,
    required double rating,
  }) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 352,
        height: 320,
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
            // gambar dengan rounded
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                height: 192,
                width: 352,
                fit: BoxFit.cover,
              ),
            ),

            // Bagian bawah card
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
                    '$location • $surface',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                      height: 20 / 14,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Price + Button
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DurationPage(
                                title: title,
                                type: '$location • $surface',
                                courtprice: courtprice,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Select",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1.0,
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
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Sports Courts",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 28 / 18,
            letterSpacing: 0,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.black),
            tooltip: 'Booking History',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Membungkus seluruh konten dengan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Membuat Column mengisi lebar penuh
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search courts...',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 12),

              // Filter Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: _filter,
                    hint: Text(
                      'Sort by',
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    items: ['Terbaru', 'Lama', 'Termurah', 'Termahal', 'Berdasarkan Bintang']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _filter = value!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: _selectedLocation ?? 'All',
                    hint: Text(
                      'Location',
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    items: ['All', 'Indoor', 'Outdoor'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Daftar Lapangan
              Column(
                children: getFilteredCourts().map((court) {
                  return _buildFieldRent(
                    title: court['title'],
                    location: court['location'],
                    surface: court['surface'],
                    courtprice: court['courtprice'],
                    imagePath: court['imagePath'],
                    rating: court['rating'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}