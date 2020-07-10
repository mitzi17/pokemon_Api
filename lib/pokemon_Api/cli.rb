module PokemonApi
    class CLI
        def start
            puts ""
            puts "*************************************"
            puts "HELLO WELCOME TO THE ONLINE POKEDEX!!"
            puts "*************************************"
            puts ""
            puts ""
            sleep(1.2)
            puts "Please select a number from the list below to get more options about that Pokemon."
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "

            API.get_pokemon
            display_pokemon_names
            
            
        end

        def display_pokemon_names
            Pokemon.all.each.with_index(1) do |pokemon_obj, idx|
                puts "#{idx}. #{pokemon_obj.name.capitalize}"
            end
        end

        
    end
end