require 'twitter'
require 'date'

USERNAME = "Daru_Girl"

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "2nSXrucAvvI9XKxjQcZUn0uFX"
      config.consumer_secret     = "1hudid8U6Z9Z2Gj6EeHV28G04ni0zVeMAPcuWUfFRGUOVX1WvI"
      config.access_token        = "997858584699420672-iM8qSdOtoLXaXWWho058urWuP2Kci47"
      config.access_token_secret = "RTNXv3KAdDSHX1YO9sLiOdKijvKOEVGKTfFdFd8Gv6wBr"
    end

    stream_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "2nSXrucAvvI9XKxjQcZUn0uFX"
      config.consumer_secret     = "1hudid8U6Z9Z2Gj6EeHV28G04ni0zVeMAPcuWUfFRGUOVX1WvI"
      config.access_token        = "997858584699420672-iM8qSdOtoLXaXWWho058urWuP2Kci47"
      config.access_token_secret = "RTNXv3KAdDSHX1YO9sLiOdKijvKOEVGKTfFdFd8Gv6wBr"
    end

client.update("目ぇ覚めちゃった...")
