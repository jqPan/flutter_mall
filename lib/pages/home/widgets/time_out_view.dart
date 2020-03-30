import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class TimeOutView extends StatefulWidget {
  final int count;
  final double height;
  final double width;
  final String title;
  TimeOutView(this.count, { this.title: '00点场', this.width: double.infinity, this.height: 20.0, });

  @override
  State<StatefulWidget> createState() => TimeOutViewState();
}

class TimeOutViewState extends State<TimeOutView> {
  Color color = Colors.redAccent;
  String timeOutText = '00:00:00';
  TimerUtil mTimerUtil;
  @override
  void initState() {
    mTimerUtil = TimerUtil(mTotalTime: widget.count * 1000);
    mTimerUtil.setOnTimerTickCallback((tick) {
      setState(() {
        timeOutText = _formatTimeOut(tick);
      });
    });
    mTimerUtil.startCountDown();
    super.initState();
  }

  String _formatTimeOut(int tick) {
    int dayTimes = 1000 * 60 * 60 * 24;
    int hourTimes = 1000 * 60 * 60;
    int minuteTimes = 1000 * 60;
    int day = tick ~/ dayTimes;
    int hour = (tick - day * dayTimes) ~/ hourTimes;
    int minute = (tick - day * dayTimes - hour * hourTimes) ~/ minuteTimes;
    int second = (tick - day * dayTimes - hour * hourTimes - minute * minuteTimes) ~/ 1000;

//    String dayStr = day > 10 ? day.toString() : '0$day';
    String hourStr = hour > 10 ? hour.toString() : '0$hour';
    String minuteStr = minute > 10 ? minute.toString() : '0$minute';
    String secondStr = second > 10 ? second.toString() : '0$second';
    return '$hourStr:$minuteStr:$secondStr';
  }

  @override
  void dispose() {
    if (mTimerUtil != null) {
      mTimerUtil.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Container(
    width: widget.width,
    height: widget.height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(widget.height)),
      border: Border.all(color: color)
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(widget.height)),
              color: color,
          ),
          padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().getWidth(2),
              right: ScreenUtil.getInstance().getWidth(4)
          ),
          child: Text(
            '${widget.title}',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().getSp(10.0)
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: widget.height,
            alignment: Alignment.center,
            child: Text(
              '$timeOutText',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: color,
                fontSize: ScreenUtil.getInstance().getSp(10.0)
              ),
            ),
          )
        )
      ],
    )
  );
}