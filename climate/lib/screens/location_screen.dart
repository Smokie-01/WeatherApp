import 'dart:convert';
import 'package:climate/screens/city_screen.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:climate/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  var locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  int temprature = 0;
  String weatherIcon = ' ';

  String weatherMessage = '';
  String description = '';

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weatherIcon = ' error';
        weatherMessage = ' Unable to find your location';
        return;
      }
      double temp = jsonDecode(weatherData)['main']['temp'];
      temprature = temp.toInt();

      var condition = jsonDecode(weatherData)['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);

      description = jsonDecode(weatherData)['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                      ),
                      onPressed: () async {
                        var weatherData =
                            await WeatherModel().getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 50,
                      )),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.transparent),
                    onPressed: () async {
                      var typeNamed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      if (typeNamed != null) {
                        var weatherData =
                            await weatherModel.weatherByCityName(typeNamed);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                height: 250,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temprature°C ',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(description,
                    style: TextStyle(
                      fontSize: 35,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
