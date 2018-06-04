require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  Tweet.new.random_tweet
  "#{ENV['ACCESS_TOKEN']}"
  "Tweet successd!"
end

get '/auto_reply' do
  Tweet.new.stream_reply
end
