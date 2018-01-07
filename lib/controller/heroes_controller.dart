import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class HeroesController extends RESTController {
  final heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @Operation.get()
  Future<Response> getAllHeroes() async {
    return new Response.ok(heroes);
  }

  @Operation.get("id")
  Future<Response> getHeroByID(@Bind.path("id") int id) async {
    final hero = heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
    if (hero == null) {
      return new Response.notFound();
    }

    return new Response.ok(hero);
  }
}
