import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class HeroesController extends RESTController {
  final heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
    {'id': 16, 'name': 'RubberMan'},
    {'id': 17, 'name': 'Dynama'},
    {'id': 18, 'name': 'Dr IQ'},
    {'id': 19, 'name': 'Magma'},
    {'id': 20, 'name': 'Tornado'}
  ];

  @Bind.get()
  Future<Response> getAllHeroes() async {
    return new Response.ok(heroes);
  }

  @Bind.get()
  Future<Response> getHeroByID(@Bind.path("id") int id) async {
    final hero =
    heroes.firstWhere((hero) => hero['id'] == id, orElse: () => throw new HTTPResponseException(404, "no hero"));

    return new Response.ok(hero);
  }
}
