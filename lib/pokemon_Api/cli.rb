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
        end

        
    end
end