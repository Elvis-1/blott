import 'package:blott/src/core/utils/functions/internet_checker.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  NoInternet({Key? key, required this.destinationWidget}) : super(key: key);
  Widget destinationWidget;
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  bool _isRetrying = false;

  // Method to check connectivity and retry if connected
  Future<void> _retryConnection() async {
    setState(() {
      _isRetrying = true;
    });

    // Check for connection using Singleton
    bool hasConnection =
        await ConnectionStatusSingleton.getInstance().checkConnection();

    if (hasConnection) {
      // If connection is back, navigate back to the original screen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget.destinationWidget),
        (Route<dynamic> route) => false,
      );
    } else {
      // If still no connection, show a message and keep user on NoInternet screen
      setState(() {
        _isRetrying = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Still no connection. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Text(
              "Hey, it seems like there's no internet connection.",
              style: TextStyle(
                fontFamily: "Roboto",
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15),
            if (_isRetrying)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              ElevatedButton(
                onPressed: _retryConnection,
                child: Text("Retry"),
              ),
          ],
        ),
      ),
    );
  }
}
