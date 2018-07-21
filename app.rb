require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  Tweet.new.random_tweet
  "Random tweet successed!"
end

get '/auto_reply' do
  Tweet.new.stream_reply
end

get '/update_tweet' do
  Tweet.new.update_tweet
  "Tweet successed!"
end
