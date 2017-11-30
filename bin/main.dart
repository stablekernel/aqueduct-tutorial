import 'package:heroes/heroes.dart';

Future main() async {
  var app = new Application<HeroesChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  await app.start(numberOfInstances: 2);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}