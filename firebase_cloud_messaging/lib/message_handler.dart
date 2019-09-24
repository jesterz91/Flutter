Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}
//
Future<void> _handleNotification (Map<dynamic, dynamic> message, bool dialog) async {
  var data = message['data'] ?? message;
  String expectedAttribute = data['expectedAttribute'];
  /// [...]
}