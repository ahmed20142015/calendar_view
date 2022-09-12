import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import 'model/event.dart';
import 'pages/mobile/mobile_home_page.dart';
import 'pages/web/web_home_page.dart';
import 'widgets/responsive_widget.dart';

DateTime get _now => DateTime.now();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Event>(
      controller: EventController<Event>()..addAll(_events),
      child: MaterialApp(
        title: 'Flutter Calendar Page Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: ResponsiveWidget(
          mobileWidget: MobileHomePage(),
          webWidget: WebHomePage(),
        ),
      ),
    );
  }
}

List<CalendarEventData<Event>> _events = [
  CalendarEventData(
    date: DateTime(2022, 09, 09),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(2022,09,09),
    endTime:   DateTime(2022,09,09),
    endDate:   DateTime(2022,09,09),
  ),

  CalendarEventData(
    date: DateTime(2022, 09, 08),
    title: "Ahmed Elashry",
    description: "Today is ahmed meeting.",
    startTime: DateTime(2022,09,08),
    endTime:   DateTime(2022,09,20),
    endDate:   DateTime(2022,09,20),
  ),

];
