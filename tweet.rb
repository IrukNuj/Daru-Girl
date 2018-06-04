require 'twitter'
require 'date'
require_relative './reply'

USERNAME = "Daru_Girl"

class Tweet

  def initialize
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
  end

  def random_tweet
    tweets = []
    File.open('Tweets/tweet.txt') do |tweet_txt|
      tweet_txt.each_line do |tweet_line|
        tweets.push("#{tweet_line}")
      end
    end
    @client.update("#{tweets.sample}")
  end

  def stream_reply
    morning_time = (4..10)
    day_time = (11..15)
    evening_time = (16..18)
    night_time = [*0..3],[*19..24]

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

  end#def

end
