require 'twitter'
require 'date'
require 'dotenv'
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
    if (rand(1..100) < 6)
      tweets = []
      File.open('Tweets/tweet.txt') do |tweet_txt|
        tweet_txt.each
        _line do |tweet_line|
          tweets.push("#{tweet_line}")
        end
      end
      @client.update("#{tweets.sample}")
    end
  end

  def stream_reply
    @stream_client.user do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        if !tweet.retweeted_status?
          random_favorite(tweet)
          reply_ohayo(tweet)
          reply_tsukareta(tweet)
          reply_oyasumi(tweet)
          reply_daruko(tweet)
          reply_ganbaru(tweet)
        end
      end #if
    end #stream
  end#def

end
