require 'pry'
module PokemonApi
    class API
        BASE_URL = 'https://pokeapi.co/api/v2/pokemon/'

        def self.get_pokemon
            results = RestClient.get(BASE_URL)
            
            hash_pokemons = JSON.parse(results)
            hash_pokemons["results"].each do |hash|
                Pokemon.new(hash)
            end
        end

        def self.query_pokemon(obj)
            results = RestClient.get(obj.url)
            hash_categories = JSON.parse(results)
        end
    
    end
end