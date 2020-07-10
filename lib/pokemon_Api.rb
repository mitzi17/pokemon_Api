require 'rest-client'
require 'json'
require 'pry'



require_relative "pokemon_Api/version"
require_relative "pokemon_Api/api"
require_relative "pokemon_Api/cli"
require_relative "pokemon_Api/pokemon"


module PokemonApi
  class Error < StandardError; end
  # Your code goes here...
end
