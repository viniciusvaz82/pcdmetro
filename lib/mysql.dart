import 'dart:async';

import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '162.241.2.213',
      user = 'vinici38_pcdmetro',
      db = 'vinici38_pcd';
  static int port = 8080;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}
