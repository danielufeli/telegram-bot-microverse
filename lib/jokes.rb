require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bots.rb'

# Jokes Class to Get Data from API
class Joke
  def initialize
    @values = @make_the_request
  end

  def make_the_request
    url = 'https://official-joke-api.appspot.com/jokes/programming/random'

    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
