/*!
 * Copyright (C) 2019 Ansvia
 * All Rights Reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Ansvia.
 * The intellectual and technical concepts contained
 * herein are proprietary to Ansvia
 * and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from PT. Ansvia (robin@ansvia.com).
 */

import 'dart:math';

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

DateUtils dateTimeUtils = DateUtils();

class DateUtils {
  int getDate() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int getSeed() {
    var random = Random();
    var next = random.nextDouble() * 1000000000;
    return next.floor();
  }

  ///Digunakan untuk Countdown
  String format(Duration _duration) {
    String sixDigits(int n) {
      if (n >= 100000) return "$n";
      if (n >= 10000) return "0$n";
      if (n >= 1000) return "00$n";
      if (n >= 100) return "000$n";
      if (n >= 10) return "0000$n";
      return "00000$n";
    }

    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(_duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(_duration.inSeconds.remainder(60));
    return "${_duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
  }

  // String formatYMD(var value, {String pattern = ""}) {
  //   var parse = DateTime.parse(value);
  //   pattern = pattern == null
  //       ? "-"
  //       : pattern.replaceRange(0, pattern.length, pattern);
  //   DateFormat dateFormat = DateFormat("yyyy${pattern}MM${pattern}dd");
  //   return dateFormat.format(parse);
  // }

  String formatedYYYYMMDD(int timestamp) {
    if (timestamp == 0) {
      return "-";
    }
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter =
        DateFormat('yyyy-MM-dd', Intl.getCurrentLocale()); //.yMMMd();
    return formatter.format(date);
  }

  String formatedDMMMY(String dateString) {
    var date = DateTime.parse(dateString);
    var formatter = DateFormat('dd MMM yyyy'); //.yMMMd();
    return formatter.format(date);
  }

  String formatedEvent(String dateString) {
    var date = DateTime.parse(dateString);
    var formatter = DateFormat('EEEE, dd MMM yyyy HH:mm', 'id-ID'); //.yMMMd();
    return formatter.format(date);
  }

  String formatedDMMM(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    //print("datee $date");
    var formatter = DateFormat('dd MMM'); //.yMMMd();
    return formatter.format(date);
  }

  String simpleDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('dd MMMM yyyy'); //.yMMMd();
    return formatter.format(date);
  }

  ///saat ini hanya support Jam & Menit dengan format 24:00
  ///format time ini bisa di tambahkan tipe Time, misal: WIB, Millesecond dll.
  String formatedTime(String dateString) {
    var date = DateTime.parse(dateString);
    var formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  String defaultFormat(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    // var formatter = DateFormat('dd MMM yyyy HH:mm'); //.yMMMd();
    return timeago.format(date);
  }

  // String formatedDateFull(String dateString) {
  String formatedDateFull(int timestamp) {
    if (timestamp == 0) {
      return "-";
    }
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('dd MMMM yyyy HH:mm'); //.yMMMd();
    return formatter.format(date);
  }

  String formatedDateEvent(int timestamp) {
    if (timestamp == 0) {
      return "-";
    }
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat(
        'EEEE, dd MMMM yyyy HH:mm', Intl.getCurrentLocale()); //.yMMMd();
    return formatter.format(date);
  }

  String formatedDateToDay({required int timestamp}) {
    //print("datettete $timestamp");
    if (timestamp == 0) {
      return "$timestamp";
    }
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('EEEE', 'id-ID');
    return formatter.format(date);
  }
}
