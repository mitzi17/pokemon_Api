module PokemonApi
    class Pokemon

        attr_accessor :name, :url, :abilities
        @@all = [ ]

        def initialize(hash)
            @name = hash["name"]
            @url = hash["url"]
            @abilities = [ ]
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