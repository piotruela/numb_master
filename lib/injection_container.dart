import 'package:get_it/get_it.dart';
import 'package:numb_master/core/config/asset_config.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<AssetConfig>(AssetConfig());
}
