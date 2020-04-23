require 'sinatra'
require 'sinatra/reloader'
require 'httparty'; 
require 'pry'


get '/' do
    erb(:home) 
end

get '/movie_details' do
    movie_title = params["title"]
    url = "http://omdbapi.com/?t=#{movie_title}&apikey=c73d88c6"
    result = HTTParty.get(url)
    erb(:movie_details, locals: {
        movie: result
    })
end


