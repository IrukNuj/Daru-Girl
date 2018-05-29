require 'twitter'
require 'date'

USERNAME = "Daru_Girl"

class Tweet

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = MY_CONSUMER_KEY
      config.consumer_secret     = MY_CONSUMER_SECRET
      config.access_token        = MY_ACCESS_TOKEN
      config.access_token_secret = MY_ACCESS_TOKEN_SECRET
    end

    @stream_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = MY_CONSUMER_KEY
      config.consumer_secret     = MY_CONSUMER_SECRET
      config.access_token        = MY_ACCESS_TOKEN
      config.access_token_secret = MY_ACCESS_TOKEN_SECRET
    end
  end


  def stream_reply

    morning_time = (4..10)
    day_time = (11..15)
    evening_time = (16..18)
    night_time = [*0..3],[*19..24]

    @stream_client.user do |tweet|

      if tweet.is_a?(Twitter::Tweet)

        puts(tweet.user.name)
        puts("@#{tweet.user.screen_name}")
        puts(tweet.text)
        puts("-----")

        def reply_ohayo
          if tweet.text.include?("おはよ") && (tweet.user.screen_name != USERNAME)
            case DateTime.now.hour
            when *morning_time; @client.update("@#{tweet.user.screen_name}\nおはよう、#{tweet.user.name}さん。今日も一日がんばってこー！", options = {:in_reply_to_status_id => tweet.id})
            when *day_time; @client.update("@#{tweet.user.screen_name}\nおはよう、#{tweet.user.name}さん。\nねぼすけさんだね、もうお昼だよ...?w", options = {:in_reply_to_status_id => tweet.id})
            when *evening_time; @client.update("@#{tweet.user.screen_name}\nおそよう、#{tweet.user.name}さん。もう夕方だよ...((", options = {:in_reply_to_status_id => tweet.id})
            when *night_time; @client.update("@#{tweet.user.screen_name}\nおそよう、#{tweet.user.name}さん。\nもう外真っ暗...昨日は何してたの?((", options = {:in_reply_to_status_id => tweet.id})
            end
            break
          end
        end

        def reply_tsukareta
          if tweet.text.include?("つかれた") && (tweet.user.screen_name != USERNAME)
            tweets = []
            File.open('Tweets/tukareta.txt') do |tweet_txt|
              tweet_txt.each_line do |tweet_line|
                tweets.push("#{tweet_line}")
              end
            end
            @client.update("@#{tweet.user.screen_name}\n#{tweet.user.name}さんおつかれさま、#{tweets.sample}", options = {:in_reply_to_status_id => tweet.id})
            break
          end
        end

        def reply_oyasumi
          if tweet.text.include?("おやすみ") && (tweet.user.screen_name != USERNAME)
            @client.update("@#{tweet.user.screen_name}\nおやすみなさい。", options = {:in_reply_to_status_id => tweet.id})
            break
          end
        end

        def reply_daruko
          if tweet.text.include?("だる子") && (tweet.user.screen_name != USERNAME)
            tweets = []
            File.open('Tweets/daruko.txt') do |tweet_txt|
              tweet_txt.each_line do |tweet_line|
                tweets.push("#{tweet_line}")
              end
            end
            @client.update("@#{tweet.user.screen_name}\n#{tweets.sample}", options = {:in_reply_to_status_id => tweet.id})
            @client.favorite(tweet.id)
            break
          end
        end

        def reply_ganbaru
          if tweet.text.include?("がんばる") && (tweet.user.screen_name != USERNAME)
            tweets = []
            File.open('Tweets/ganbaru.txt') do |tweet_txt|
              tweet_txt.each_line do |tweet_line|
                tweets.push("#{tweet_line}")
              end
            end
            @client.update("@#{tweet.user.screen_name}\n#{tweets.sample}", options = {:in_reply_to_status_id => tweet.id})
            break
          end
        end

      end #if
    end #str
  end

end

=begin
  tweets = []
  File.open("tweets.txt", "r") do |bot|
    @bots = bot.read.split("\n")
  end
  tweet = @bots.sample
=end

=begin
stream_client.user do |tweet|
  if tweet.is_a?(Twitter::Tweet)
    if ((tweet.text.include?("おはよ"))||(tweet.text.include?("起きた"))) && (tweet.user.screen_name != USERNAME)
      if morning_time.include?(DateTime.now.hour)
        client.update("@#{tweet.user.screen_name}\nおはよう、#{tweet.user.name}さん。今日も一日がんばってこー！", options = {:in_reply_to_status_id => tweet.id})
      elsif day_time.include?(DateTime.now.hour)
        client.update("@#{tweet.user.screen_name}\nおはよう、#{tweet.user.name}さん。\nねぼすけさんだね、もうお昼だよ?w", options = {:in_reply_to_status_id => tweet.id})
      elsif evening_time.include?(DateTime.now.hour)
        client.update("@#{tweet.user.screen_name}\nおそよう、#{tweet.user.name}さん。もう夕方...((", options = {:in_reply_to_status_id => tweet.id})
      elsif night_time.include?(DateTime.now.hour)
        client.update("@#{tweet.user.screen_name}\nおそよう、#{tweet.user.name}さん。\nもう外真っ暗だよ...昨日は何してたの?((", options = {:in_reply_to_status_id => tweet.id})
      end
    end
  end
end
=end

=begin
tweets = []

File.open('tweet.txt') do |tweet_txt|
  tweet_txt.each_line do |tweet_will_be_pushed|
    tweets.push("#{tweet_will_be_pushed}")
  end
end

while true
  sleep_time = 3600 + rand(72000)
  client.update("#{tweets.sample}")
  sleep sleep_time
end

=end

#  client.update("現在時刻を取得するよ\n\n...#{Date.today.year}年、#{Date.today.month}月#{Date.today.day}日、#{DateTime.now.hour}時#{DateTime.now.minute}分#{DateTime.now.second}秒だね。")
