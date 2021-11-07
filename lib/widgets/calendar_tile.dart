import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advent_calender/models/calendar_model.dart';
import 'package:flutter_advent_calender/screens/calendar_view/calendar_view.dart';

class ComeBackFromCalendarView extends Notification {
  ComeBackFromCalendarView();
}

class CalendarTile extends StatelessWidget {
  final CalendarModel? calendar;
  final int doorsToOpen;
  const CalendarTile({
    Key? key,
    required this.calendar,
    required this.doorsToOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
              CupertinoPageRoute(
                builder: (context) => CalendarView(
                  calendar: calendar!,
                ),
              ),
            )
            .then((value) => ComeBackFromCalendarView().dispatch(context));
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  calendar!.title,
                  style: const TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  doorsToOpen == 0
                      ? "Alles geöffnet"
                      : "$doorsToOpen Türchen zu öffnen",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 30,
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/present.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
