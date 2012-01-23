require 'sinatra'
require 'json'

class Planet
  attr_accessor :name

  def initialize planet_name
    @name = planet_name
  end

  def to_json arg = nil
    { 'name' => name }.to_json
  end

  def self.from_json json_string
    Planet.new JSON.parse(json_string)['name']
  end
end

PLANETS = [ "mercury", "venus", "earth", "mars", "juputer", "saturn",
            "uranus", "neptune" ].map{ |planet_name| Planet.new planet_name}

get '/' do
  redirect '/planets'
end

get '/planets' do
  PLANETS.to_json
end

get '/planets/:id' do |id|
  PLANETS[id.to_i].to_json
end
