import 'package:pokeapi/model/pokemon/pokemon.dart';

import '../../../core/repository/api_services.dart';
import '../../../core/repository/api_path.dart';

class PokemonDetailRepo {
  Future<Pokemon> getPokemonDetail(String pokemonName) async {
    final response =
        await ApiServices().getRequest(path: '${APiPath.pokemon}/$pokemonName');
    var pokemonDetail = Pokemon.fromJson(response.data);
    return pokemonDetail;
  }
}
