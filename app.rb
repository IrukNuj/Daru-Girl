require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  Tweet.newrandom_tweet
  a = ENV['ACCESS_TOKEN']
  "#{a}"
  "Tweet successd!"
end

get '/auto_reply' do
  Tweet.new.stream_reply
end
