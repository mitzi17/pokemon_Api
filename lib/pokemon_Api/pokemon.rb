module PokemonApi
    class Pokemon

        attr_accessor :name, :url, :abilities, :moves, :types
        @@all = [ ]

        def initialize(hash)
            @name = hash["name"]
            @url = hash["url"]
            @abilities = [ ]
            @moves = [ ]
            @types = [ ]
            save
        end

        def save
            @@all << self
        end

        def self.all
            @@all
        end

    end
end