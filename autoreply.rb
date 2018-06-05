require 'twitter'
require 'date'
require 'dotenv'
require_relative './reply'

USERNAME = "Daru_Girl"

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

@stream_client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

@stream_client.user do |tweet|
  if tweet.is_a?(Twitter::Tweet)
    reply_ohayo(tweet)
    reply_tsukareta(tweet)
    reply_oyasumi(tweet)
    reply_daruko(tweet)
    reply_ganbaru(tweet)
    @client.favorite(tweet.id) if rand(1..10) > 9
  end #if
end #stream
