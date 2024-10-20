class CustomDuration {
  final int _milliseconds;

  CustomDuration._(this._milliseconds) {
    if (_milliseconds < 0) {
      throw ArgumentError("Duration cannot be negative");
    }
  }
  factory CustomDuration.fromHours(int hours) {
    return CustomDuration._(hours * 60 * 60 * 1000);
  }
  factory CustomDuration.fromMinutes(int minutes) {
    return CustomDuration._(minutes * 60 * 1000);
  }
  factory CustomDuration.fromSeconds(int seconds) {
    return CustomDuration._(seconds * 1000);
  }
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._(this._milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = this._milliseconds - other._milliseconds;
    if (result < 0) {
      throw ArgumentError("Resulting duration cannot be negative");
    }
    return CustomDuration._(result);
  }

  bool operator >(CustomDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  } }
void main() {
  CustomDuration duration1 = CustomDuration.fromHours(3); // 3 hours
  CustomDuration duration2 = CustomDuration.fromMinutes(45); // 45 minutes

  print(duration1 + duration2); 
  print(duration1 > duration2); 

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e);
  }
}
