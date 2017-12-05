import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

class HeroesController extends RESTController {
  HeroesController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllHeroes({@Bind.query("name") String name}) async {
    final heroQuery = new Query<Hero>(context);
    if (name != null) {
      heroQuery.where.name = whereContainsString(name, caseSensitive: false);
    }
    final heroes = await heroQuery.fetch();

    return new Response.ok(heroes);
  }

  @Operation.get("id")
  Future<Response> getHeroByID(@Bind.path("id") int id) async {
    final heroQuery = new Query<Hero>(context)
      ..where.id = whereEqualTo(id);

    final hero = await heroQuery.fetchOne();

    if (hero == null) {
      return new Response.notFound();
    }
    return new Response.ok(hero);
  }
}
