require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'qtc-sdk'

set :port, ENV['PORT']

get '/tweets/:hashtag' do
  #eds = Qtc::Eds::Client.new('53e0d5335a3d8b6580002abe') #test
  eds = Qtc::Eds::Client.new('544d36b6e5bde5522202172d') #production
  tweets = eds.collection('tweets')
  query = {
    :q => {
    'hashtags' => {'$in' => [params[:hashtag]]
      }
    },
    :limit => 50,
    :sort => [{"sortBy" => "createdAt","direction" => "desc"}]
  }
  content_type :json,'charset' => 'utf-8'
  result = tweets.find(query)
  result.to_json
end
