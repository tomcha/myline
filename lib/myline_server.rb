require 'myline'
require 'myline_server/server'
require 'sinatra/base'

# Your code goes here...
module MylineServer
  class ResponseServer < Sinatra::Base
    get '/' do
      'test done'
    end

    get '/linebot/callback' do
      'callback'
    end
    post '/linebot/callback' do
      request.body.rewind  # 既に読まれているときのため
      data = request.body.read
      if data == ""
        return 'no data'
      end
      json_data = JSON.parse data
      path = File.expand_path('../../log/', __FILE__)
      File.open(File.join(path,'params.log'), "a") do |f|
        f.puts "\n#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')} #{data}"
        f.puts json_data.to_s
      end
      'params logged.'
    end
  end
end
