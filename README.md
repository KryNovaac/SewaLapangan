Sewa Lapangan
Overview
Sewa Lapangan is a mobile application built with Flutter that allows users to browse, filter, and book various sports courts (e.g., futsal, basketball, badminton, tennis, and volleyball) based on location, price, rating, and availability. The app provides a seamless user experience with features such as court search, payment options (cash and QRIS), and booking history tracking.
Features

Court Listing: Browse a variety of sports courts with details like name, location, surface type, price, and rating.
Search and Filter: Search courts by name, location, or surface, and filter by newest, oldest, cheapest, most expensive, or by rating.
Booking Process: Select a court, choose duration, and proceed to payment with options for cash on location or QRIS digital payment.
Payment Integration: Supports cash payment on arrival and QRIS payment with a scannable QR code.
Booking Confirmation: Displays a success page with booking details and options to download receipts or return to the home screen.
History Tracking: View booking history via the app's history page.

Prerequisites

Flutter SDK: Ensure Flutter is installed (version 3.x or higher recommended). Install Flutter.
Dart: Included with Flutter installation.
IDE: Use Android Studio, VS Code, or any editor with Flutter support.
Dependencies: Ensure the following packages are available via pubspec.yaml:
google_fonts: ^6.3.2
(Optional) qr_flutter: ^4.1.0 for QR code generation.



Installation

Clone the Repository:
git clone https://github.com/your-username/sewa-lapangan.git
cd sewa-lapangan


Install Dependencies:
flutter pub get


Set Up Assets:

Add image assets (e.g., futsal.png, basketball.png, etc.) to the assets/images/ directory.
Update pubspec.yaml with the asset paths:flutter:
  assets:
    - assets/images/futsal.png
    - assets/images/basketball.png
    - assets/images/badminton.png
    - assets/images/tennis.png
    - assets/images/volley.png
    - assets/images/QR.png




Run the Application:

Connect a device or start an emulator.
Run the app:flutter run





Usage

Home Page: View the list of available courts, use the search bar to find specific courts, and filter using the dropdown menus.
Duration Page: Select the booking duration after choosing a court.
Payment Method Page: Choose between "Payment on Location" (cash) or "Pay via QRIS" (digital payment).
QRIS Page: Scan the QR code to complete the payment and confirm with "I Have Paid".
Success Page: View booking details, download the receipt, or return to the home screen.
History Page: Access past booking history.

Project Structure

lib/: Contains all Dart files.
home.dart: Main page with court listings and filters.
duration.dart: Duration selection page.
payment_method.dart: Payment method selection page.
qris.dart: QRIS payment page.
success.dart: Booking success confirmation page.
history.dart: Booking history page.


assets/images/: Directory for image assets (e.g., court images, QR code).

Contributing
Contributions are welcome! Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit them (git commit -m "Add new feature").
Push to the branch (git push origin feature-branch).
Open a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.
Contact
For questions or support, please open an issue on the GitHub repository or contact the maintainers.
Acknowledgments

Thanks to the Flutter community for the robust framework.
Inspiration from various open-source sports booking applications.
