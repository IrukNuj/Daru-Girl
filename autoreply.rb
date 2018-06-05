require 'twitter'
require 'date'
require 'dotenv'
require_relative './reply'

USERNAME = "Daru_Girl"

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "2nSXrucAvvI9XKxjQcZUn0uFX"
  config.consumer_secret     = "1hudid8U6Z9Z2Gj6EeHV28G04ni0zVeMAPcuWUfFRGUOVX1WvI"
  config.access_token        = "997858584699420672-iM8qSdOtoLXaXWWho058urWuP2Kci47"
  config.access_token_secret = "RTNXv3KAdDSHX1YO9sLiOdKijvKOEVGKTfFdFd8Gv6wBr"
end

@stream_client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "2nSXrucAvvI9XKxjQcZUn0uFX"
  config.consumer_secret     = "1hudid8U6Z9Z2Gj6EeHV28G04ni0zVeMAPcuWUfFRGUOVX1WvI"
  config.access_token        = "997858584699420672-iM8qSdOtoLXaXWWho058urWuP2Kci47"
  config.access_token_secret = "RTNXv3KAdDSHX1YO9sLiOdKijvKOEVGKTfFdFd8Gv6wBr"
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
