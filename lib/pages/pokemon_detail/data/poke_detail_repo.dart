import 'package:pokeapi/model/pokemon/pokemon.dart';

import '../../../core/repository/api_services.dart';
import '../../../core/repository/api_path.dart';

class PokemonDetailRepo {
  Future<Pokemon> getPokemonDetail(int pokemonId) async {
    final response =
        await ApiServices().getRequest(path: '${APiPath.pokemon}/$pokemonId');
    var pokemonDetail = Pokemon.fromJson(response.data);
    return pokemonDetail;
  }
}
