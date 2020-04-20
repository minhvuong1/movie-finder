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
    title = result["Title"]
    year_released = result["Year"]
    director = result["Director"]
    writer = result["Writer"]
    actors = result["Actors"]
    genre = result["Genre"]
    image_link = result["Poster"]
    plot = result["Plot"]
    box_office = result["BoxOffice"]
    runtime = result["Runtime"]
    metascore = result["Metascore"]
    imdb_rating = result["imdbRating"]
    imdb_votes = result["imdbVotes"]
    production = result["Production"]
    erb(:movie_details, locals: {
        title: title,
        movie_year: year_released,
        director: director,
        actors: actors,
        image_link: image_link,
        genre: genre,
        plot: plot,
        writer: writer,
        box_office: box_office,
        runtime: runtime,
        metascore: metascore,
        imdb_rating: imdb_rating,
        imdb_votes: imdb_votes,
        production: production
    })
end


