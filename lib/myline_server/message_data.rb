module MylineServer
  def get_uid(message_hash)
    uid ||= message_hash['events'][0]['source']['userID']
  end

  def get_replytoken(message_hash)
    replytoken ||= message_hash['events'][0]['replyToken']
  end
end
