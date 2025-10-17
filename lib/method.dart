import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/qris.dart';
import 'package:sewa_lapangan/success.dart';

class PaymentMethodPage extends StatefulWidget {
  final String title;
  final String type;
  final int duration;
  final int price;

  const PaymentMethodPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Method",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 28 / 20,
            letterSpacing: 0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Payment",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 28 / 22,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Select your preferred payment method",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
                height: 24 / 16,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 16),

            // Pay on Location
            _buildPaymentOption(
              method: "Payment on Location",
              subtitle: "Cash payment",
              description: "Pay with cash when you arrive at the location",
              icon: Icons.store,
            ),
            const SizedBox(height: 16),

            // Pay via QRIS
            _buildPaymentOption(
              method: "Pay via QRIS",
              subtitle: "Digital payment",
              description: "Scan QR code to pay instantly with your e-wallet",
              icon: Icons.qr_code_2,
            ),
            const SizedBox(height: 16),

            // Booking Policy
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Booking Policy\nYour payment method can't be changed after completing the order",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        height: 20 / 14,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            const SizedBox(height: 24),

            // Tombol I Have Paid (muncul setelah pilih metode)
            if (selectedMethod != null)
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
                  onPressed: () {
                    if (selectedMethod == "Pay via QRIS") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrisPage(
                            title: widget.title,
                            type: widget.type,
                            duration: widget.duration,
                            price: widget.price,
                          ),
                        ),
                      );
                    } else if (selectedMethod == "Payment on Location") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(
                            title: widget.title,
                            type: widget.type,
                            duration: widget.duration,
                            price: widget.price,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.check, color: Colors.white, size: 18),
                  label: Text(
                    "I Have Paid",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      height: 24 / 18,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String method,
    required String subtitle,
    required String description,
    required IconData icon,
  }) {
    final bool isSelected = selectedMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = method;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.black, size: 36),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        height: 24 / 18,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 20 / 14,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFF3F4F6),
              thickness: 1,
              height: 16,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}