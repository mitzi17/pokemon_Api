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

            pokemon_selection = gets.chomp

            @pokemon_obj = Pokemon.all[pokemon_selection.to_i - 1]
            
            API.query_pokemon(@pokemon_obj)

            list_of_categories

        end

        def list_of_categories

            puts "Enter a number from the list of categories to get more details about #{@pokemon_obj.name.capitalize}."
            puts "Type 'menu' to select a different Pokemon or type 'exit' to quit the app."
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
            puts "1. Abilities"
            puts "2. Moves"
            puts "3. Types"
                      
            category_selection = gets.chomp

            case category_selection

                when "1"
                puts "#{@pokemon_obj.name.capitalize}'s abilities are:"
                display_abilities(@pokemon_obj)
                list_of_categories
                when "2"
                puts "#{@pokemon_obj.name.capitalize}'s moves are:"            
                display_moves(@pokemon_obj)
                list_of_categories
                when "3"
                puts "#{@pokemon_obj.name.capitalize}'s type(s) is/are:"
                display_types(@pokemon_obj)
                list_of_categories
                when "menu"
                menu
                when "exit"
                puts "Thank you for using the Online Pokedex. See you soon!"
                else
                puts "Whoops! Not a valid entry."
                list_of_categories
            end
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

        def display_moves(pokemon_obj)
            @pokemon_obj.moves.each.with_index(1) do |move, idx|
                puts "#{idx}. #{move.capitalize}"
            end
        end

        def display_types(pokemon_obj)
            @pokemon_obj.types.each.with_index(1) do |type, idx|
                puts "#{idx}. #{type.capitalize}"
            end
        end

        

        
    end
end