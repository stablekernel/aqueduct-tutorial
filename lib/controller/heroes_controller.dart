import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

class HeroesController extends RESTController {
  HeroesController(this.context);

  final ManagedContext context;

  @Bind.get()
  Future<Response> getAllHeroes({@Bind.query("name") String name}) async {
    final heroQuery = new Query<Hero>(context);
    if (name != null) {
      heroQuery.where.name = whereContainsString(name, caseSensitive: false);
    }
    final heroes = await heroQuery.fetch();

    return new Response.ok(heroes);
  }

  @Bind.get()
  Future<Response> getHeroByID(@Bind.path("id") int id) async {
    final heroQuery = new Query<Hero>(context)
      ..where.id = whereEqualTo(id);

    final hero = await heroQuery.fetchOne();

    if (hero == null) {
      return new Response.notFound();
    }
    return new Response.ok(hero);
  }

  @Bind.post()
  Future<Response> createHero(@Bind.body() Hero hero) async {
    final query = new Query<Hero>()
      ..values.name = hero.name;

    final insertedHero = await query.insert();

    return new Response.ok(insertedHero);
  }
}
