require 'json'
require 'yaml'
require 'line/bot'

module MylineCommand
  class Command

    def initialize
      config_txt = YAML.load_file("config.yml")
      ENV["LINE_CHANNEL_SECRET"] = config_txt["line"]["line_channel_secret"]
      ENV["LINE_CHANNEL_TOKEN"] = config_txt["line"]["line_channel_token"]
      ENV["LINE_USERID"] = config_txt["line"]["line_uid"]
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
    end
    
    def start_unbrella_advice
      ua = MylineCommand::UnbrellaAdviser.new
      message = ua.get_umbrella_data
      if (Time.now.strftime('%H').to_i <= 10)
        post_text = "今日の傘指数は#{message[:today_rainypercent]}だよ。\n#{message[:today_umbrella_advice]}"
      else
        post_text = "明日の傘指数は#{message[:tomorrow_rainypercent]}なのだ。\n#{message[:tomorrow_umbrella_advice]}"
      end
      @client.push_message(ENV["LINE_USERID"], {type: 'text', text: post_text})
      puts "OK"
    end

    def start_dust_calender
      dc = MylineCommand::DustCalender.new
      schedule = dc.check_schedule
      if (Time.now.strftime('%H').to_i <= 9)
        post_text = schedule[0].join("\n")
      else
        post_text = schedule[1].join("\n")
      end
      @client.push_message(ENV["LINE_USERID"], {type: 'text', text: post_text})
      puts "OK"
    end
  end
end
