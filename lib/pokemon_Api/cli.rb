module PokemonApi
    class CLI
        def start
            puts ""
            puts "*************************************"
            puts "HELLO WELCOME TO THE ONLINE POKEDEX!!"
            puts "*************************************"
            puts ""
            puts ""
            sleep(2)
            puts "Please select a number from the list below to get more options about that Pokemon."
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "

            get_pokemon_list
        end

        def get_pokemon_list
            API.all.collet |pokemon_obj|
                puts "pokemon.name"
            end
        end
    end
end