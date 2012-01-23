require File.join(File.dirname(__FILE__), '../solar_system_planets')
require 'rspec'
require 'rack/test'
require 'uri'

describe "solar_system_planets" do
  include Rack::Test::Methods

  let!(:app) { Sinatra::Application }

  it "should return mercury on 0 id" do
    get '/planets/0'
    Planet.from_json(last_response.body).name.should eql('mercury')
  end

  it "should redirect to '/planets' from '/'" do
    get '/'
    last_response.status.should equal 302
    URI(last_response.header["Location"]).path.should eql('/planets')
  end

  # it "should return 404 when not existing planet id present" do
  #   get '/planets/22'
  #   last_response.status.should equal 404
  # end

  it "should return moons of a planet" do
    get '/planets/0/moons'
    last_response.status.should equal 200
    JSON.parse(last_response.body).should be_kind_of? Array
  end
end
