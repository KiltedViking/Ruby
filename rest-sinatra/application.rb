require 'sinatra'
require 'sinatra/json'
require 'bundler'
# Example copied while watching YouTube video "RESTful APIs in Sinatra" by Envato Tuts+.
# I changed into using a file (SQLite database)

# CHANGE to match path to your folder
connection_string = 'sqlite:///Users/bjorn/Documents/Programming/Ruby/rest-sinatra/reviews.sqlite'
# ... or use in-memory
# connection_string = 'sqlite::memory:'

#Require all gems in Gemfile and *then* the model class, as it relies on DataMapper
Bundler.require
require 'review'

#Set up DataMapper
DataMapper.setup(:default, connection_string)
DataMapper.finalize
DataMapper.auto_migrate!

#Test - open using http://localhost:4567/
get '/' do
  "Hello world!"
end

#REST methods (7 of them - but 2 of them - NEW and EDIT - shows forms for adding/editing )
# GET /reviews
get '/reviews' do
  content_type :json

  reviews = Review.all
  reviews.to_json
end

# GET /reviews/1
get '/reviews/:id' do
  content_type :json
  review = Review.get params[:id]
  review.to_json
end

# POST /reviews
post '/reviews' do
  content_type :json
  review = Review.new params[:review]

  if review.save
    status 201
  else
    status 500
    json review.errors.full_messages
  end
end

# PUT /reviews/1
put '/reviews/:id' do
  content_type :json
  review = Review.get params[:id]
  if review.update params[:review]
    status 200
    json "Review was updated."
  else
    status 500
    json review.errors.full_messages
  end
end

# DELETE /reviews/1
delete '/reviews/:id' do
  content_type :json
  review = Review.get params[:id]
  if review.destroy
    status 200
    json "Review was removed."
  else
    status 500
    json "There was a problem removing the review."
  end
end