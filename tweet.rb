require 'twitter'
require 'date'
require_relative 'reply.rb'

USERNAME = "Daru_Girl"

class Tweet

  def initialize
    @client = Twitter::REST::Client.new do |config|

    end

    @stream_client = Twitter::Streaming::Client.new do |config|

    end
  end

  def random_tweet
    tweets = []
    File.open('Tweets/tweet.txt') do |tweet_txt|
      tweet_txt.each_line do |tweet_will_be_pushed|
        tweets.push("#{tweet_will_be_pushed}")
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
      end #if
    end #stream
  end#def

end
