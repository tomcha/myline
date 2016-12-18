require 'myline'
require 'myline_server/server'
require 'myline_server/message_data'
require 'myline_command/command'
require 'sinatra/base'

#include MylineServer::MessageData
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
      message_text = MessageData.get_message_text(json_data)
      if(message_text =~ /(酒|ハイボール|ワイン|飲過|飲み過)/)
        client = MylineCommand::Command.new
        client.send_reply_message(MessageData.get_replytoken(json_data), "今日は何杯飲んだの？\n飲み過ぎはダメですよ！") 
      end
      #puts get_uid(json_data)
      #path = File.expand_path('../../log/', __FILE__)
      #File.open(File.join(path,'params.log'), "a") do |f|
      #  f.puts "\n#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}\n"
      #  f.puts json_data.to_s
      #end
      #'params logged.'
    end
  end
end
