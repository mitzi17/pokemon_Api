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
            sleep(1)
            menu
        end

        def menu
            puts ""
            puts "Please select a number from the list below to get more options about that Pokemon."
            puts "Type 'exit' to quit the app."
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
        
            display_pokemon_names

            pokemon_selection = gets.chomp

            if pokemon_selection.to_i.between?(1, 20) == true
                @pokemon_obj = Pokemon.all[pokemon_selection.to_i - 1]
                API.query_pokemon(@pokemon_obj)
                list_of_attributes
            elsif pokemon_selection == "exit"
                puts ""
                puts "******************************************************"
                puts "THANK YOU FOR USING THE ONLINE POKEDEX. SEE YOU SOON!!"
                puts "******************************************************"
            else
                puts ""
                puts "Invalid input. Please try again."
                puts ""
                menu
            end
        end

        def list_of_attributes

            puts ""
            puts "Enter a number from the list of attributes to get more details about #{@pokemon_obj.name.capitalize}."
            puts "Type 'menu' to select a different Pokemon or type 'exit' to quit the app."
            puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
            puts "1. Abilities"
            puts "2. Moves"
            puts "3. Types"

            user_attribute_selection
        end

        def user_attribute_selection
                      
            attribute_selection = gets.chomp

            case attribute_selection

                when "1"
                puts ""
                puts "#{@pokemon_obj.name.capitalize}'s abilities are:"
                puts "- - - - - - - - - - - - - - - - - - - - - - - - "
                display_abilities(@pokemon_obj)
                list_of_attributes
                when "2"
                puts ""
                puts "#{@pokemon_obj.name.capitalize}'s moves are:"
                puts "- - - - - - - - - - - - - - - - - - - - - - "            
                display_moves(@pokemon_obj)
                list_of_attributes
                when "3"
                puts ""
                puts "#{@pokemon_obj.name.capitalize}'s type(s) is/are:"
                puts "- - - - - - - - - - - - - - - - - - - - - - - - - "
                display_types(@pokemon_obj)
                list_of_attributes
                when "menu"
                menu
                when "exit"
                puts ""
                puts "*****************************************************"
                puts "THANK YOU FOR USING THE ONLINE POKEDEX. SEE YOU SOON!"
                puts "*****************************************************"
                else
                puts ""
                puts "Whoops! Not a valid entry."
                puts ""
                list_of_attributes
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