module PokemonApi
    class Pokemon

        attr_accessor :name, :url
        @@all = [ ]

        def initialize(hash)
            @name = hash["name"]
            @url = hash["url"]
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