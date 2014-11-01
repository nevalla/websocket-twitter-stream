require 'rubygems'
require 'bundler/setup'

require 'tweetstream'
require 'qtc-sdk'


TweetStream.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY'] #'MCCmRkvHUVkmUVJiOUQWkhdSw'
  config.consumer_secret    = ENV['CONSUMER_SECRET'] #'QSTflEmmQLjRJKotKGKe2CRA0FHt6tW9qDqDzwqr17lF9MkAQg'
  config.oauth_token        = ENV['OAUTH_TOKEN'] #'133188022-xZQgDbJxlxGHQQ7H764L5PGAsICyXrJOrY6VCtiv'
  config.oauth_token_secret = ENV['OAUTH_SECRET'] #'QUcoPIxG1i6IUrSxlp9iE6CKyYp5LUnxATIxPlUroYlfQ'
  config.auth_method        = :oauth
end

eds = Qtc::Eds::Client.new(ENV['EDS_BACKEND_ID'])
mws = Qtc::Mws::Client.new(ENV['MWS_GATEWAY_ID'], {access_token: ENV['MWS_SECURITY_TOKEN']})
tweets = eds.collection('tweets')

daemon = TweetStream::Daemon.new('tracker', :multiple => true, :no_pidfiles => true)

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

    #tweets.insert(tweet)
    mws.send_message(tweet.to_json, {sockets: nil, tags: ['QtDD14']})
  end

end
