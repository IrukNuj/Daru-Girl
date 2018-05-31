require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  "Streaming..."
  Tweet.new.stream_reply
end

get '/random_tweet' do
  Tweet.new.random_tweet
  "Tweet successd!"
end
