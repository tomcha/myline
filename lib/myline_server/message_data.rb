module MylineServer
  class MessageData
    def self.get_uid(message_hash)
      uid ||= message_hash['events'][0]['source']['userID']
    end

    def self.get_replytoken(message_hash)
      replytoken ||= message_hash['events'][0]['replyToken']
    end

    def self.get_message_text(message_hash)
      if (message_hash['events'][0]['message']['type'] == 'text')
        message_text ||= message_hash['events'][0]['message']['text']
      else
        message_text = ''
      end
      message_text
    end
  end
end
