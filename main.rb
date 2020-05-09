require 'sinatra'
require 'sinatra/reloader'
require 'httparty' # method to make request
require 'pry'
require 'pg'

require_relative 'models/movie'

get '/' do
    erb(:home)  # conventions - needs to be named layout
end

get '/search' do
    movie_title = params["title"]
    url = "http://omdbapi.com/?s=#{movie_title}&apikey=#{ENV['OMDB_API_KEY']}"
    result = HTTParty.get(url)    # Make a request - returns a hash
    erb(:search, locals: {
        movies: result["Search"] 
    })
end

get '/movie_details/:title' do
    movie_title = params[:title]
    if find_movie_by_title(movie_title).count > 0
        erb(:movie_details, locals: {
            movie: find_movie_by_title(movie_title)[0]
        })
    else 
        url = "http://omdbapi.com/?t=#{movie_title}&apikey=#{ENV['OMDB_API_KEY']}"
        result = HTTParty.get(url)
        if find_movie_by_image_url(result["Poster"]).count == 0
            store_movie(result["Title"], result["Poster"], result["Year"])
        end 
        erb(:movie_details, locals: {
            movie: result
        })
    end
end



