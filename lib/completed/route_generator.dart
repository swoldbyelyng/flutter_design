import 'package:flutter/material.dart';
import 'package:flutter_design/completed/getting_started/credit_card2.dart';
import 'getting_started/welcome.dart';
import 'discarded/name_nmr.dart';
import 'getting_started/name_nmr2.dart';
import 'discarded/confirm_pin.dart';
import 'discarded/pin_verification.dart';
import 'getting_started/pin_test.dart';
import 'getting_started/information.dart';
import 'discarded/credit_card.dart';
import 'getting_started/lovpakke.dart';
import 'package:flutter_design/home/home2.dart';
import 'package:flutter_design/home/primary_frame.dart';
import 'package:flutter_design/make_booking/booking_location.dart';
import 'package:flutter_design/make_booking/booking_available_locations.dart';
import 'package:flutter_design/make_booking/booking_availabilities.dart';
import 'package:flutter_design/completed/arguments/availabilities_args.dart';
import 'package:flutter_design/completed/arguments/booking_args.dart';
import 'package:flutter_design/completed/arguments/confirmation_args.dart';
import 'package:flutter_design/make_booking/booking_confirmation.dart';




class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Welcome());
      case '/NameAndNumber':
      // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => const NameNumber2(),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();


      case '/ConfirmPin':
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => const PinVerification(),
          );
        }
        return _errorRoute();

      case '/Creditcard':
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => const AddNewCardScreen(),
          );
        }
        return _errorRoute();

      case '/Information':
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => const Information(),
          );
        }
        return _errorRoute();


        case '/Lovpakke':
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => const Lovpakke(),
          );
        }
        return _errorRoute();

      case '/LicenseeHome':
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => const LicenseeHome(),
          );
        }
        return _errorRoute();

      case '/PrimaryFrame':
        if(args is String) {
          return MaterialPageRoute(
            builder: (_) => const PrimaryFrame(),
          );
        }
        return _errorRoute();

      case '/Booking':
        if(args is BookingArgs) {
          return MaterialPageRoute(
            builder: (_) => BookingLocation(args),
          );
        }
        return _errorRoute();

      case '/AvailableLocations':
        if(args is BookingArgs) {
          return MaterialPageRoute(
            builder: (_) => AvailableLocations(args: args),
          );
        }
        return _errorRoute();

      case '/BookingAvailabilities':
        if(args is AvailabilitiesArguments) {
          return MaterialPageRoute(
            builder: (_) => BookingAvailabilities(arguments: args),
          );
        }
        return _errorRoute();

      case '/ConfirmBooking':
        if(args is ConfirmationArgs) {
          return MaterialPageRoute(
            builder: (_) => ConfirmBooking(args: args),
          );
        }
        return _errorRoute();

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}