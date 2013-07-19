require 'rubygems'
require 'sinatra'
require_relative './scraper.rb'

get '/' do
  "Welcome to Weewit!"
end

post '/fit' do
  fithash = scraper(params[:url])
   
  

