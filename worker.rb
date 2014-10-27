require 'rubygems'
require 'bundler/setup'

require 'tweetstream'
require 'qtc-sdk'


TweetStream.configure do |config|
  config.consumer_key       = '87iiFtaopgn8yA0ejbRm3Q'
  config.consumer_secret    = 'IJJ3kYHbbRts1x1Ipr5OGpQvzdT9WzliGOkpNNkGUk'
  config.oauth_token        = '133188022-i8tpj4Igq4iUJJGJwX4oKr1VibUPlpRRs0PQevF3'
  config.oauth_token_secret = 'SpVVCk0wexi5DDPnqFTPrbvkvABCbKPuOzeR3wOE'
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
