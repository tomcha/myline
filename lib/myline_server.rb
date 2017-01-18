require 'myline'
require 'myline_server/server'
require 'myline_server/message_data'
require 'myline_command/command'
require 'sinatra/base'
require 'active_record'
require 'myline_server/models/task'

#include MylineServer::MessageData
# Your code goes here...
module MylineServer
  class ResponseServer < Sinatra::Base

    configure do
      db_path = File.expand_path(File.join(root, '..', 'db', 'sqlite.db'))
      ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: db_path
      )
      p db_path
    end

    get '/' do
        Task.create!(userid: 'aaa', task_text: 'text', remind_datetime: '2017-1-18 12:00', deleted_flag: 0)
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
      userid = MessageData.get_uid(json_data)
      reply_message = ''
      message_text.gsub!(/　/, ' ')

      if(message_text =~ /foo/)
        reply_message = 'bar'

      elsif(message_text =~ /^help:/)
        reply_message = <<~EOS
            set:
            書式
            set:2017-1-1 13:05
            西暦年-月-日 24時:分 登録するタスクを書く\n
            list:
            登録されているタスクの一覧を表示する\n
            del:
            書式
            del:3
            listで確認したタスク番号を書いてタスクを個別に削除する
        EOS

      elsif(message_text =~ /^set:/)
        message_text =~ %r(^set:(\d+-\d+-\d+)\s(\d+:\d+)?\s(.+)$)
        date = $1
        if $2 == nil
          time = '0:00' 
        else
          time = $2
        end
        task_text = $3
        p ENV['USER']
        Task.create!(userid: userid, task_text: task_text, remind_datetime: "#{date} #{time}",deleted_flag: 0)
        reply_message = "タスクを#{date} #{time}に通知する様セットしました。"

      elsif(message_text =~ /^list:/)
        reply_message = ''
        list = Task.where(userid: userid, deleted_flag: 0).order('remind_datetime ,id')
        i = 1
        list.each do |record|
          record.update(task_num: i)
          reply_Message += "#{record.task_num} #{record.remind_datetime} #{redord.task_text}\n"
          i += 1
        end
        reply_message.chomp!

      elsif(message_text =~ /^del:/)
        message_text =~ %r(^del:\d+)
        db_id = $1
        repyly_message = "タスクを削除しました。"
      end
      puts reply_message
        client = MylineCommand::Command.new
        client.send_reply_message(MessageData.get_replytoken(json_data),reply_message) 
    end
  end
end
