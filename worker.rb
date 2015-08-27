require 'rubygems'
require 'bundler/setup'

require 'tweetstream'
require 'qtc-sdk'

HASHTAG = "#QtDD14"

TweetStream.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY']
  config.consumer_secret    = ENV['CONSUMER_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_SECRET']
  config.auth_method        = :oauth
end

eds = Qtc::Eds::Client.new(ENV['EDS_BACKEND_ID'])
mws = Qtc::Mws::Client.new(ENV['MWS_GATEWAY_ID'], {access_token: ENV['MWS_SECURITY_TOKEN']})
tweets = eds.collection('tweets')

daemon = TweetStream::Daemon.new('tracker', :multiple => true, :no_pidfiles => true)

daemon.track(HASHTAG) do |status|

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
    mws.send_message(tweet.to_json, {sockets: nil, tags: [HASHTAG]})
  end

end
