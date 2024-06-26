class VehicleData {
  final int doorStatus;
  final int rpm;
  final int speed;
  final int accelerationPedal;
  final bool brakePedal;
  final int steeringWheelAngle;
  final Map<String, double> acceleration;
  final int timestamp;
  final double latitude;
  final double longitude;

  VehicleData({
    required this.doorStatus,
    required this.rpm,
    required this.speed,
    required this.accelerationPedal,
    required this.brakePedal,
    required this.steeringWheelAngle,
    required this.acceleration,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });

  VehicleData.initial()
      : doorStatus = 0,
        rpm = 0,
        speed = 0,
        accelerationPedal = 0,
        brakePedal = false,
        steeringWheelAngle = 0,
        acceleration = {'x': 0.0, 'y': 0.0, 'z': 0.0},
        timestamp = DateTime.now().millisecondsSinceEpoch,
        latitude = 48.151698,
        longitude = 17.073334;

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      doorStatus: json['door_status'],
      rpm: json['rpm'],
      speed: json['speed'],
      accelerationPedal: json['acceleration_pedal'],
      brakePedal: json['brake_pedal'] ?? false,
      steeringWheelAngle: json['steering_wheel_angle'],
      acceleration: {
        'x': json['acceleration']['x'],
        'y': json['acceleration']['y'],
        'z': json['acceleration']['z']
      },
      timestamp: json['timestamp'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
    );
  }
}
