require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  Tweet.newrandom_tweet
  "Tweet successd!"
end

get '/auto_reply' do
  Tweet.new.stream_reply
end
