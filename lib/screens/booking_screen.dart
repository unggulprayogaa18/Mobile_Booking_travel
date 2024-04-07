import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_nav_bar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedHotel = '';
  int nights = 1;
  int numberOfPeople = 1;
  bool isVIP = false;
  bool isNonVIP = false;

  List<String> hotelNames = [
    'D Omah Hotel Yogya',
    'Greenhouse Boutiqul Hotel',
    'Candi Tirta Raharjo',
    'Alana Hotel',
  ];

  Future<void> _submitBooking() async {
    if (selectedHotel.isEmpty || nights <= 0 || numberOfPeople <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all required fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      CollectionReference bookings =
          FirebaseFirestore.instance.collection('bookings');

      await bookings.add({
        'hotel': selectedHotel,
        'nights': nights,
        'numberOfPeople': numberOfPeople,
        'status': isVIP ? 'VIP' : isNonVIP ? 'Non VIP' : 'Regular',
        'timestamp': FieldValue.serverTimestamp(),
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Booking submitted successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      setState(() {
        selectedHotel = '';
        nights = 1;
        numberOfPeople = 1;
        isVIP = false;
        isNonVIP = false;
      });
    } catch (error) {
      print('Error submitting booking: $error');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Booking Room',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(index: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/gallery1.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Color.fromARGB(255, 222, 223, 224),
                    width: 22.0,
                  ),
                ),
                height: 270,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedHotel.isNotEmpty &&
                        hotelNames.contains(selectedHotel)
                    ? selectedHotel
                    : null,
                hint: Text('-PILIH NAMA HOTEL-'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedHotel = newValue!;
                  });
                },
                items: hotelNames.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    nights = int.tryParse(value) ?? 0;
                  });
                },
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Number of Nights",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    numberOfPeople = int.tryParse(value) ?? 0;
                  });
                },
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Number of People",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isVIP,
                    onChanged: (bool? value) {
                      setState(() {
                        isVIP = value ?? false;
                        isNonVIP = false;
                      });
                    },
                  ),
                  Text('VIP'),
                  SizedBox(width: 20),
                  Checkbox(
                    value: isNonVIP,
                    onChanged: (bool? value) {
                      setState(() {
                        isNonVIP = value ?? false;
                        isVIP = false;
                      });
                    },
                  ),
                  Text('Non VIP'),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  onPressed: _submitBooking,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
