def reply_ohayo(tweet)
  if tweet.text.include?("おはよ") && (tweet.user.screen_name != USERNAME)
    case DateTime.now.hour
    when *morning_time; @client.update("@#{tweet.user.screen_name}\nおはよう、#{tweet.user.name}さん。今日も一日がんばってこー！", options = {:in_reply_to_status_id => tweet.id})
    when *day_time; @client.update("@#{tweet.user.screen_name}\nおはよう、#{tweet.user.name}さん。\nねぼすけさんだね、もうお昼だよ...?w", options = {:in_reply_to_status_id => tweet.id})
    when *evening_time; @client.update("@#{tweet.user.screen_name}\nおそよう、#{tweet.user.name}さん。もう夕方だよ...((", options = {:in_reply_to_status_id => tweet.id})
    when *night_time; @client.update("@#{tweet.user.screen_name}\nおそよう、#{tweet.user.name}さん。\nもう外真っ暗...昨日は何してたの?((", options = {:in_reply_to_status_id => tweet.id})
  end
end

def reply_tsukareta(tweet)
  if tweet.text.include?("つかれた") && (tweet.user.screen_name != USERNAME)
    tweets = []
    File.open('Tweets/tukareta.txt') do |tweet_txt|
      tweet_txt.each_line do |tweet_line|
        tweets.push("#{tweet_line}")
      end
    end
    @client.update("@#{tweet.user.screen_name}\n#{tweet.user.name}さんおつかれさま、#{tweets.sample}", options = {:in_reply_to_status_id => tweet.id})
  end
end

def reply_oyasumi
  if tweet.text.include?("おやすみ") && (tweet.user.screen_name != USERNAME)
    @client.update("@#{tweet.user.screen_name}\nおやすみなさい。", options = {:in_reply_to_status_id => tweet.id})
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
  end
end
end