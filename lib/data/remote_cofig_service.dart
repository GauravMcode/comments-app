import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logger/logger.dart';

class FirebaseRemoteConfigService {
  final logger = Logger();
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  bool get maskEmail => _remoteConfig.getBool("maskEmail");

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();
    if (updated) {
      logger.i('The config has been updated.');
    } else {
      logger.i('The config is not updated..');
    }
  }

  Stream<RemoteConfigUpdate> updateStream() {
    return _remoteConfig.onConfigUpdated;
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await fetchAndActivate();
  }
}
