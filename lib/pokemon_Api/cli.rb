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

            
        end


        def display_pokemon_names
            Pokemon.all.each.with_index(1) do |pokemon_obj, idx|
                puts "#{idx}. #{pokemon_obj.name.capitalize}"
            end
        end

        
    end
end