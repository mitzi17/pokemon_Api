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
            hash_attributes = JSON.parse(results)

            get_abilities(obj, hash_attributes["abilities"])
            get_moves(obj, hash_attributes["moves"])
            get_types(obj, hash_attributes["types"])
        end

        def self.get_abilities(obj, array_abilities)
            array_abilities.each do |hash|
                obj.abilities << hash["ability"]["name"]
            end
        end

        def self.get_moves(obj, array_moves)
            array_moves.each do |hash|
                obj.moves << hash["move"]["name"]
            end
        end

        def self.get_types(obj, array_types)
            array_types.each do |hash|
                obj.types << hash["type"]["name"]
            end
        end

    
    
    end
end