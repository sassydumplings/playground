# nav:
# - home
# - movies
# - stocks
# - images

# homepage
# - brief para introducing user to site

# movies
# - form to enter movie name
# - when submitted, use movies gem to find information
# - show title, rating, director, some other info.
# - use images gem to get a random image for the movie and show it also.
# - Make sure if no movie found site works alright.

# stocks
# - form to enter stock symbol
# - when submitted, display stock price (a.k.a. last-traded price) and other basic info
# - Handle exception if invalid stock symbol entered

# images
# - form to enter keyword for image search
# - when submitted, display the image.
# - have a button on the page to automatically resubmit the same search
# - have a button on the page to do a search for a random word 
# (Make a list of 20+ words to choose the random search from)

require "sinatra"
require "sinatra/reloader"
require "movies"
require "stock_quote"
require "image_suckr"

get "/" do 
  erb :index
end

get "/movies" do 
  erb :movies
end

get "/movie_details" do 
    @movie = Movies.find_by_title(params['movie'], {tomatoes: "true"})
  erb :movie_detail
end

get "/stock_quote" do 
  erb :stock_quote
end

get "/stock_detail" do 
  @stocks = StockQuote::Stock.quote(params[:stock])

  erb :stock_detail
end

get "/image_suckr" do 
  erb :image_suckr
end

get "/image_details" do 
  suckr = ImageSuckr::GoogleSuckr.new 
  @image = params['image_search']
  @img_url = suckr.get_image_url({"q" => "#{@image}"})
  erb :image_details
end

