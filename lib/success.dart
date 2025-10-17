import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/home.dart';

class SuccessPage extends StatelessWidget {
  final String title;
  final String type;
  final int duration;
  final int price;

  const SuccessPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Check icon
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),


            // Title
            Text(
              "Booking Successful",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Your court has been reserved successfully",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                letterSpacing: 0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Booking details card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking Details",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 24 / 18,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildDetailRow("Court Name", title),
                  _buildDetailRow(
                    "Date",
                    "Dec 15",
                  ), // nanti bisa diganti dynamic
                  _buildDetailRow("Duration", "$duration hours"),
                  _buildDetailRow("Payment Method", type),
                  const Divider(),
                  _buildDetailRow(
                    "Total Price",
                    "Rp. ${price.toString()}",
                    isBold: true,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.download, color: Colors.white),
                label: Text(
                  "Download Receipt",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.grey.shade100,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: const Icon(Icons.home, color: Colors.black),
                label: Text(
                  "Back to Home",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    letterSpacing: 0,
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

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 20 / 14,
              letterSpacing: 0,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              height: 20 / 14,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}