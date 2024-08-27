import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final MqttServerClient _client = MqttServerClient('ba2f2af4644d4fb990991fedeca6cf08.s1.eu.hivemq.cloud', '',);

  String payload = '';

  MqttService() {
    _client.port = 8883;
    _client.secure = true; // Enable TLS
    _client.logging(on: true);
    _client.keepAlivePeriod = 20;
  }

  Future<void> connect() async {
    try {
      _client.connectionMessage = MqttConnectMessage()
          .withClientIdentifier('flutter_client') // Ensure this is unique
          .authenticateAs('AdMEKH', 'AdMEKH123')
          .startClean();

      await _client.connect();

      _client.subscribe('sensor/readings', MqttQos.atMostOnce);

      _client.updates?.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
        final message = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        payload = message;
        // Notify listeners about the new message
        _listener?.call();
      });
    } on Exception catch (e) {
      debugPrint('Exception: $e');
    }
  }

  void addListener(void Function() listener) {
    _listener = listener;
  }

  void Function()? _listener;
}
