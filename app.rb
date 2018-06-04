require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  Tweet.new.random_tweet
  "Tweet successd!"
end
