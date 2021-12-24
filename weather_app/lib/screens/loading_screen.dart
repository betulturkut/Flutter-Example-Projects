import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/main_screen.dart';
import 'package:weather_app/utils/location.dart';
import 'package:weather_app/utils/weather.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationData;
  Future<void> getLocationData() async{
    locationData = LocationHelper();
    await locationData..getCurrentLocation();

    if(locationData.latitude==null || locationData.longitude==null){
      print("Konum bilgisi bulunamadı");
    }
    else{
      print("latitude: "+locationData.latitude.toString());
      print("longitude: "+locationData.longitude.toString());
    }
  }
  void GetWeatherData() async{
    await getLocationData();

    WeatherData weatherData= WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if(weatherData.currentTemperature==null || weatherData.currentCondition==null){
      print("API'den sıcaklık veya durum bilgisi boş dönüyor");
    }
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MainScreen(weatherData: weatherData,);
    }));
  }

  @override
  void initState() {
    super.initState();
    GetWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple,Colors.black38]
          )
        ),
        child: const Center(
          child: SpinKitDualRing(
            color: Colors.white70,
            size: 120.0,
            duration: Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}
