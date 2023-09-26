library ui_extensions;

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart' as collection;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

import '../../intl/i18n.dart';
import 'app_theme.dart';

extension StringUtils on String {
  Key toKey() => Key(this);

  ValueKey<String> toValueKey() => ValueKey<String>(this);

  ReCase get _recase => ReCase(this);

  String camelCase() => _recase.camelCase;

  String constantCase() => _recase.constantCase;

  String sentenceCase() => _recase.sentenceCase;

  String snakeCase() => _recase.snakeCase;

  String dotCase() => _recase.dotCase;

  String paramCase() => _recase.paramCase;

  String pathCase() => _recase.pathCase;

  String pascalCase() => _recase.pascalCase;

  String headerCase() => _recase.headerCase;

  String titleCase() => _recase.titleCase;
}

extension NumberUtils on num {
  static const int _width = 375; // reference width from designs
  // ignore: unused_field
  static const int _height = 800;

  double responsive(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double scaleFactor = data.size.shortestSide / _width;
    final double responsive = this * scaleFactor;
    return responsive;
  }
}

extension TextStyleUtils on TextStyle {
  TextStyle get responsive => copyWith(fontSize: fontSize);

  Widget withText(String text, {TextAlign align = TextAlign.center}) => Text(
        text,
        textAlign: align,
        style: this,
      );

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle withSize(double size) => copyWith(fontSize: size);
}

extension ListWidgetUtils on List<Widget> {
  List<Widget> mapPadding({
    required EdgeInsets padding,
  }) {
    assert(padding != null);
    return map((Widget child) {
      return Padding(
        padding: padding,
        child: child,
      );
    }).toList();
  }

  List<Widget> mapWithDivider({
    required EdgeInsets padding,
  }) {
    assert(padding != null);
    return map((Widget child) {
      return Padding(
        padding: padding,
        child: Column(children: <Widget>[
          child,
          Divider(
            thickness: 0.5,
            color: Colors.black.withOpacity(0.25),
          ),
        ]),
      );
    }).toList();
  }

  List<Widget> mapWithDividerNotLast() {
    return map((Widget child) {
      return Column(children: <Widget>[
        child,
        if (this.indexOf(child) != this.length - 1)
          Divider(
            height: 1,
          ),
      ]);
    }).toList();
  }
}

extension IterableUtils<T> on Iterable<T> {
  List<Widget> mapToWidget(Widget Function(T) mapper) {
    assert(mapper != null);
    return map<Widget>(mapper).toList();
  }
}

extension ListUtils<T> on List<T> {
  Map<S, List<T>> groupBy<S>(S Function(T) mapper) {
    return collection.groupBy<T, S>(this, mapper);
  }
}

extension BuiltListUtils<T> on BuiltList<T> {
  List<Widget> mapToWidget(Widget Function(T) mapper) {
    assert(mapper != null);
    return map<Widget>(mapper).toList();
  }

  Map<S, List<T>> groupBy<S>(S Function(T) mapper) {
    return collection.groupBy<T, S>(this, mapper);
  }
}

extension SizeUtils on Size {
  Size responsive(BuildContext context) => Size(
        width.responsive(context),
        height.responsive(context),
      );
}

extension PlatformUtilsUtils on Object {
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  bool get isMacos => defaultTargetPlatform == TargetPlatform.macOS;

  bool get isFuchsia => defaultTargetPlatform == TargetPlatform.fuchsia;

  bool get isWeb => kIsWeb;

  bool get isPlatformMobile => isAndroid || isIOS;

  bool get isPlatformDesktop => isWindows || isLinux || isMacos;
}

extension BuildContextUtils on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get mediaSize => mediaQuery.size;

  ThemeData get theme => Theme.of(this);

  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;

  bool get isDarkTheme => theme.brightness == Brightness.dark;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  ButtonThemeData get buttonTheme => ButtonTheme.of(this);

  IconThemeData get iconTheme => IconTheme.of(this);

  AppStrings get strings => AppLocalizations.of(this);

  ModalRoute<T>? getModalRoute<T>() => ModalRoute.of<T>(this);

  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);

  NavigatorState get navigator => Navigator.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension ErrorUtils on BuildContext {
  Future<void> handleError(Object error, [StackTrace? stackTrace]) async {
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          error.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: theme.errorColor,
      ),
    );
  }

  Future<void> handleErrorDialog(Object error, [StackTrace? stackTrace]) async {
    return showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Oops!'),
          content: Text('$error\n$stackTrace'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => navigator.pop(),
            ),
          ],
        );
      },
    );
  }
}

extension DateExtensions on DateTime? {
  String timeLeft() {
    if (this == null) {
      return '-';
    }

    String counter = '';
    Duration timeLeft = this!.difference(DateTime.now());

    int daysLeft = timeLeft.inDays;
    int hoursLeft = timeLeft.inHours - (daysLeft * 24);
    int minLeft = timeLeft.inMinutes - (daysLeft * 24 * 60) - (hoursLeft * 60);
    int secLeft = timeLeft.inSeconds -
        (daysLeft * 24 * 60 * 60) -
        (hoursLeft * 60 * 60) -
        (minLeft * 60);

    counter += daysLeft <= 9 ? '0$daysLeft' : '$daysLeft';
    counter += ':';
    counter += hoursLeft <= 9 ? '0$hoursLeft' : '$hoursLeft';
    counter += ':';
    counter += minLeft <= 9 ? '0$minLeft' : '$minLeft';
    counter += ':';
    counter += secLeft <= 9 ? '0$secLeft' : '$secLeft';

    return counter;
  }

  String getNotificationTime() {
    DateTime now = DateTime.now();
    if (this == null) {
      return '';
    }
    if (now.day == this!.day &&
        now.month == this!.month &&
        now.year == this!.year) {
      return '${formatHHMMA()}';
    } else if (now.day == this!.day + 1 &&
        now.month == this!.month &&
        now.year == this!.year) {
      return 'Yesterday at ${formatHHMMA()}';
    } else if (this!.year == DateTime.now().year) {
      return formatMMDDWW();
    } else {
      return '${formatDDMMMYYYY()} at ${formatHHMMA()} ';
    }
  }

  bool isSameDateTime(DateTime other) {
    if (this == null) return false;

    return this?.day == other.day &&
        this?.month == other.month &&
        this?.year == other.year &&
        this?.hour == other.hour &&
        this?.minute == other.minute;
  }

  DateTime formatUTC() {
    return DateTime.utc(this!.year, this!.month, this!.day);
  }

  String formatYMMM() {
    if (this == null) {
      return '';
    }
    return DateFormat.yMMM().format(this!);
  }

  String formatMMM() {
    if (this == null) {
      return '';
    }
    return DateFormat.MMM().format(this!);
  }

  String formatHHMMA() {
    if (this == null) {
      return '';
    }
    return DateFormat('hh.mm a').format(this!).toLowerCase();
  }

  String formatYMMMM() {
    if (this == null) {
      return '';
    }
    return DateFormat.yMMMM().format(this!);
  }

  String formatMMDDYYYY() {
    if (this == null) {
      return '';
    }
    return DateFormat.yMMMd().format(this!);
  }

  String formatDDMMMYYYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('dd MMM yyyy').format(this!);
  }

  String formatDDhMMMhYYYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('dd-MMM-yyyy').format(this!);
  }

  String formatDDMMYYYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  String formatMMDDYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('MM/dd/yy').format(this!);
  }

  String formatDDMMYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('dd/MM/yy').format(this!);
  }

  String formatDDcMMMYYYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('dd, MMMM yyyy').format(this!);
  }

  String formatMMMDDYYYY() {
    if (this == null) {
      return '';
    }
    return DateFormat('MMM-dd-yyyy').format(this!);
  }

  String formatMMMMMDDTT() {
    if (this == null) {
      return '';
    }
    return DateFormat('MMMM dd, hh:mm a').format(this!);
  }

  String formatMMDDWW() {
    DateTime now = DateTime.now();

    if (this == null) {
      return '';
    }
    if (now.day == this!.day &&
        now.month == this!.month &&
        now.year == this!.year) {
      return 'Today${DateFormat(', EEE hh.mm a').format(this!)}';
    }
    return DateFormat('dd MMM, EEE hh.mm a').format(this!);
  }

  String formatDDMMMYYYYcHHMM() {
    if (this == null) {
      return '';
    }
    return DateFormat('dd MMM yyyy, HH:mm').format(this!);
  }
}

typedef ValidatorFunction = String? Function(String? value);

extension Validators on BuildContext {
  ValidatorFunction chainValidators(List<ValidatorFunction> validators) {
    return (String? value) {
      for (final ValidatorFunction validator in validators) {
        final String? error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  String? isNotEmptyValidator(String? value) {
    return (value?.isEmpty ?? true) ? strings.cannotBeEmpty : null;
  }

  ValidatorFunction get mobileNumberValidator {
    return chainValidators(<String? Function(String?)>[
      isNotEmptyValidator,
      _mobileNumberValidator,
    ]);
  }

  ValidatorFunction get emailValidator {
    return chainValidators(<String? Function(String?)>[
      isNotEmptyValidator,
      _emailValidator,
    ]);
  }

  String? _mobileNumberValidator(String? number) {
    if (_mobileRegEx.hasMatch(number ?? '')) {
      return null;
    }

    return strings.enterValidMobileNumber;
  }

  String? _emailValidator(String? email) {
    if (_emailRegx.hasMatch(email ?? '')) {
      return null;
    }

    return strings.enterValidEmail;
  }

  RegExp get _mobileRegEx {
    return RegExp('(0/91)?[7-9][0-9]{9}');
  }

  RegExp get _emailRegx {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }
}
