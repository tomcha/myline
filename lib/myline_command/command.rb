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
      message = {type: 'text', text: 'hello'}
      response = @client.push_message(ENV["LINE_USERID"], message)
      p response
      puts "OK"
    end

    def start_dust_callender
    end
  end
end
