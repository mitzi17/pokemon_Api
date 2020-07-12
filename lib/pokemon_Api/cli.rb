require "pry"
module PokemonApi
    class CLI
        def start
            puts ""
            puts "*************************************"
            puts "HELLO WELCOME TO THE ONLINE POKEDEX!!"
            puts "*************************************"
            puts ""
            puts ""
            API.get_pokemon
            sleep(1.2)
            menu
        end

        def menu
            puts "Please select a number from the list below to get more options about that Pokemon."
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        
            display_pokemon_names

            input = gets.chomp

            @pokemon_obj = Pokemon.all[input.to_i - 1]
            
            API.query_pokemon(@pokemon_obj)

            display_abilities(@pokemon_obj)
            binding.pry            
        end


        def display_pokemon_names
            Pokemon.all.each.with_index(1) do |pokemon_obj, idx|
                puts "#{idx}. #{pokemon_obj.name.capitalize}"
            end
        end

        def display_abilities(pokemon_obj)
            @pokemon_obj.abilities.each.with_index(1) do |ability, idx|
                puts "#{idx}. #{ability.capitalize}"
            end
        end

        

        
    end
end