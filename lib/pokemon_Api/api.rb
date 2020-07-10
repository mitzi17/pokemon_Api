require 'pry'
module PokemonApi
    class API
        BASE_URL = 'https://pokeapi.co/api/v2/pokemon/'

        def self.get_pokemon
            results = RestClient.get(BASE_URL)
            
            hash_pokemons = JSON.parse(results)
            hash_pokemons["results"].each do |hash|
                Pokemon.new(hash)
            binding.pry
            end
        end
    
    end
end