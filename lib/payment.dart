import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/method.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  final String type;
  final int duration; // berapa jam
  final int price; // total harga (sudah kali durasi)

  const PaymentPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String formatPrice(int price) {
    final formatted = price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
    return 'Rp. $formatted,00';
  }

  @override
  Widget build(BuildContext context) {
    const int serviceFee = 5000;

    // harga per jam = total / durasi
    final int pricePerHour = widget.price ~/ widget.duration;

    // subtotal = total harga (sudah sesuai durasi)
    final int subtotal = widget.price;

    // total + service fee
    final int total = subtotal + serviceFee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Summary",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 28 / 18, // line-height 100% dari 18px
            letterSpacing: 0,
          ),
        ),
        // note:
        // layout:
        // width: 149;
        // height: 28;
        // angle: 0 deg;
        // opacity: 1;
        // top: 1px;
        // left: -0.33px;
        // Typograph:
        // font-family: Poppins;
        // font-weight: 600;
        // font-style: SemiBold;
        // font-size: 18px;
        // leading-trim: NONE;
        // line-height: 100%;
        // letter-spacing: 0%;
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== Card Utama =====
            // note:
            // Layout:
            // width: 336;
            // height: 466;
            // border-radius: 16px;
            // border-width: 1px;
            // angle: 0 deg;
            // opacity: 1;
            // top: 32px;
            // left: 24px;
            // background: #F4F4F4;
            // box-shadow: 0px 1px 2px 0px #0000000D;
            Center(
              child: Container(
                width: 336,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0x0D000000), // 0px 1px 2px 0px #0000000D
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 28 / 20,
                        letterSpacing: 0,
                      ),
                      // Note:
                      // Layout:
                      // width: 194;
                      // height: 28;
                      // angle: 0 deg;
                      // opacity: 1;
                      // font-family: Poppins;
                      // font-weight: 600;
                      // font-style: SemiBold;
                      // font-size: 20px;
                      // leading-trim: NONE;
                      // line-height: 28px;
                      // letter-spacing: 0%;
                    ),
                    Text(widget.type, style: TextStyle(color: Colors.grey[600])),
                    const SizedBox(height: 16),
                    // Note:
                    // Layout:
                    // width: 190;
                    // height: 20;
                    // angle: 0 deg;
                    // opacity: 1;
                    // top: 2px;
                    // left: 20px;
                    // font-family: Poppins;
                    // font-weight: 400;
                    // font-style: Regular;
                    // font-size: 14px;
                    // leading-trim: NONE;
                    // line-height: 20px;
                    // letter-spacing: 0%;
                    // background: #4B5563; (untuk font)

                    // Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_today, size: 18),
                        const SizedBox(width: 8),
                        const Text(
                          "Date",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // width: 110;
                        // height: 24;
                        // angle: 0 deg;
                        // opacity: 1;
                        // top: 12px;
                        // left: 176.42px;
                        // font-family: Poppins;
                        // font-weight: 600;
                        // font-style: SemiBold;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                      ],
                    ),
                    // note:tambahkan garis disini,
                    // width: 286;
                    // height: 49;
                    // angle: 0 deg;
                    // opacity: 1;
                    // border-bottom-width: 1px;
                    // border-bottom: 1px solid #1C1C1C
                    // background: #000000;
                    const Divider(color: Colors.black, thickness: 1),
                    const SizedBox(height: 12),

                    // Duration
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time, size: 18),
                        const SizedBox(width: 8),
                        const Text(
                          "Duration",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.duration} Hours",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // width: 110;
                        // height: 24;
                        // angle: 0 deg;
                        // opacity: 1;
                        // top: 12px;
                        // left: 176.42px;
                        // font-family: Poppins;
                        // font-weight: 600;
                        // font-style: SemiBold;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                      ],
                    ),
                    // note:tambahkan garis disini,
                    // width: 286;
                    // height: 49;
                    // angle: 0 deg;
                    // opacity: 1;
                    // border-bottom-width: 1px;
                    // border-bottom: 1px solid #1C1C1C
                    // background: #000000;
                    const Divider(color: Colors.black, thickness: 1),
                    const SizedBox(height: 12),

                    // Price per Hour
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.attach_money, size: 18),
                        const SizedBox(width: 8),
                        const Text(
                          "Price per Hour",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          formatPrice(pricePerHour),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // width: 110;
                        // height: 24;
                        // angle: 0 deg;
                        // opacity: 1;
                        // top: 12px;
                        // left: 176.42px;
                        // font-family: Poppins;
                        // font-weight: 600;
                        // font-style: SemiBold;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Subtotal
                    // note:
                    // width: 286;
                    // height: 130;
                    // angle: 0 deg;
                    // opacity: 1;
                    // top: 311px;
                    // left: 25px;
                    // border-top-width: 1px;
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Subtotal (${widget.duration} hours)",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // width: 148;
                        // height: 24;
                        // angle: 0 deg;
                        // opacity: 1;
                        // font-family: Poppins;
                        // font-weight: 400;
                        // font-style: Regular;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                        const Spacer(),
                        Text(
                          formatPrice(subtotal),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // width: 85;
                        // height: 24;
                        // angle: 0 deg;
                        // opacity: 1;
                        // left: 202px;
                        // font-family: Poppins;
                        // font-weight: 500;
                        // font-style: Medium;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Service Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Service Fee",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // font-family: Poppins;
                        // font-weight: 400;
                        // font-style: Regular;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                        const Spacer(),
                        Text(
                          formatPrice(serviceFee),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 24 / 16,
                            letterSpacing: 0,
                          ),
                        ),
                        // font-family: Poppins;
                        // font-weight: 500;
                        // font-style: Medium;
                        // font-size: 16px;
                        // leading-trim: NONE;
                        // line-height: 24px;
                        // letter-spacing: 0%;
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 28 / 18,
                            letterSpacing: 0,
                          ),
                        ),
                        // width: 47;
                        // height: 28;
                        // angle: 0 deg;
                        // opacity: 1;
                        // top: 13px;
                        // font-family: Poppins;
                        // font-weight: 600;
                        // font-style: SemiBold;
                        // font-size: 18px;
                        // leading-trim: NONE;
                        // line-height: 28px;
                        // letter-spacing: 0%;
                        const Spacer(),
                        Text(
                          formatPrice(total),
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 28 / 20,
                            letterSpacing: 0,
                            color: Colors.deepPurple,
                          ),
                        ),
                        // width: 116;
                        // height: 28;
                        // angle: 0 deg;
                        // opacity: 1;
                        // top: 13px;
                        // left: 171px;
                        // font-family: Poppins;
                        // font-weight: 700;
                        // font-style: Bold;
                        // font-size: 20px;
                        // leading-trim: NONE;
                        // line-height: 28px;
                        // letter-spacing: 0%;
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ===== Booking Policy =====
            // bagian ini untuk jarak
            // width: 336;
            // height: 114.5;
            // border-radius: 12px;
            // angle: 0 deg;
            // opacity: 1;
            // top: 548px;
            // left: 29px;
            // background: #F9FAFB;
            // border: 1px solid #E5E7EB
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 336,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Booking Policy",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 20 / 14,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Free cancellation up to 5 hours before your booking time. Equipment rental available on-site.",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 20 / 12,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // ===== Tombol ===== 
            // Bagian ini untuk jarak button dengan element lain
            // width: 390;
            // height: 121;
            // angle: 0 deg;
            // opacity: 1;
            // top: 763px;
            // left: -3px;
            // border-top-width: 1px;
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 336,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodPage(
                          title: widget.title,
                          type: widget.type,
                          duration: widget.duration,
                          price: widget.price,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Choose Payment Method →",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}