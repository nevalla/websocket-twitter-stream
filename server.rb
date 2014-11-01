require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'qtc-sdk'

set :port, ENV['PORT']

get '/tweets/:hashtag' do

  eds = Qtc::Eds::Client.new(ENV['EDS_BACKEND_ID'])
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

get '/websocket_uri' do
  mws = Qtc::Mws::Client.new(ENV['MWS_GATEWAY_ID'], {access_token: ENV['MWS_SECURITY_TOKEN']})
  socket = mws.create_socket(["QtDD14"])
  content_type :json,'charset' => 'utf-8'
  socket.to_json
end
