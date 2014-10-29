require 'rubygems'
require 'bundler/setup'

require 'tweetstream'
require 'qtc-sdk'


TweetStream.configure do |config|
  config.consumer_key       = 'MCCmRkvHUVkmUVJiOUQWkhdSw'
  config.consumer_secret    = 'QSTflEmmQLjRJKotKGKe2CRA0FHt6tW9qDqDzwqr17lF9MkAQg'
  config.oauth_token        = '133188022-xZQgDbJxlxGHQQ7H764L5PGAsICyXrJOrY6VCtiv'
  config.oauth_token_secret = 'QUcoPIxG1i6IUrSxlp9iE6CKyYp5LUnxATIxPlUroYlfQ'
  config.auth_method        = :oauth
end

eds = Qtc::Eds::Client.new('544d36b6e5bde5522202172d') #production
tweets = eds.collection('tweets')

daemon = TweetStream::Daemon.new('tracker', :multiple => true, :no_pidfiles => true)
daemon.on_error do |message|
  puts message
end
daemon.on_delete do |status_id, user_id|
  tweets.remove(status_id)
end
daemon.track('#QtDD14') do |status|

  if !status.text.start_with?('RT @')
    tweet = {
      created: status.created_at,
      tweet_id: status.id,
      text: status.text,
      name: status.user.name,
      screen_name: status.user.screen_name,
      profile_img_url: status.user.profile_image_uri,
      hashtags: status.hashtags.map{|h| h.text.downcase }
    }

    tweets.insert(tweet)
  end

end
