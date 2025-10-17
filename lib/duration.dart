import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/payment.dart';

// Note:
// Layout: 
//         width: 167;
// height: 28;
// angle: 0 deg;
// opacity: 1;
// top: 1px;
// left: -0.33px;
// typograpgh:
// font-family: Poppins;
// font-weight: 600;
// font-style: SemiBold;
// font-size: 18px;
// leading-trim: NONE;
// line-height: 100%;
// letter-spacing: 0%;

class DurationPage extends StatefulWidget {
  final String title;
  final String type;
  final int courtprice; 

  const DurationPage({
    super.key,
    required this.title,
    required this.type,
    required this.courtprice,
  });

  @override
  State<DurationPage> createState() => _DurationPageState();
}

class _DurationPageState extends State<DurationPage> {
  // Fungsi format price dengan dua desimal
  String formatPrice(int price) {
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
    return 'Rp $formatted,00';
  }

  @override
  Widget build(BuildContext context) {
    // list packages dibuat di dalam build supaya bisa akses widget.courtprice
    final packages = [
      {
        "duration": 1,
        "subtitle": "Perfect for training",
        "price": widget.courtprice,
      },
      {
        "duration": 2,
        "subtitle": "Best value for groups",
        "price": widget.courtprice + 40000,
      },
      {
        "duration": 3,
        "subtitle": "Great for tournaments",
        "price": widget.courtprice + 80000,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Mengatur background menjadi putih secara eksplisit
      appBar: AppBar(
        
        title: Text(
          "Package Duration",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 28 / 18, // line-height 100% dari 18px
            letterSpacing: 0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          final int duration = package["duration"] as int;
          final int price = package["price"] as int;

          return GestureDetector(
            onTap: () {
              // Data dilempar ke page lain
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    title: widget.title,
                    type: widget.type,
                    duration: duration,
                    price: price,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              width: 352, // Note: Layout: width: 352;
              height: 86, // Note: Layout: height: 86;
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Note: border-radius: 12px;
                border: Border.all(color: const Color(0xFFE5E7EB)), // Note: border: 1px solid #E5E7EB
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0D000000), // Note: box-shadow: 0px 1px 2px 0px #0000000D;
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                // Note:
                // Layout:
                // width: 352;
                // height: 86;
                // border-radius: 12px;
                // border-width: 1px;
                // angle: 0 deg;
                // opacity: 1;
                // top: 226px;
                // left: 16px;
                // border: 1px solid #E5E7EB
                // box-shadow: 0px 1px 2px 0px #0000000D;
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // durasi + subtitle
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$duration Hour${duration > 1 ? 's' : ''}",
                        // Note: 
                        // Layout:
                        // font-family: Poppins;
                        // font-weight: 600;
                        // font-style: SemiBold;
                        // font-size: 18px;
                        // leading-trim: NONE;
                        // line-height: 28px;
                        // letter-spacing: 0%;
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 28 / 18,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        package["subtitle"] as String,
                        // Note:
                        // Layout:
                        // font-family: Poppins;
                        // font-weight: 400;
                        // font-style: Regular;
                        // font-size: 14px;
                        // leading-trim: NONE;
                        // line-height: 20px;
                        // letter-spacing: 0%;
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 20 / 14,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                  // harga
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        formatPrice(price),
                        // Note:
                        // Layout:
                        // font-family: Poppins;
                        // font-weight: 700;
                        // font-style: Bold;
                        // font-size: 20px;
                        // leading-trim: NONE;
                        // line-height: 28px;
                        // letter-spacing: 0%;
                        // text-align: right;
                        // pastikan agar 100000, menjadi Rp 100.000,00
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 28 / 20,
                          letterSpacing: 0,
                        ),
                      ),
                      const Text(
                        "per session",
                        // Note:
                        // Layout:
                        // font-family: Poppins;
                        // font-weight: 400;
                        // font-style: Regular;
                        // font-size: 12px;
                        // leading-trim: NONE;
                        // line-height: 16px;
                        // letter-spacing: 0%;
                        // text-align: right;
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}