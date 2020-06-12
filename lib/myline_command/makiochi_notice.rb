require 'net/http'
require 'myline/secret'

module MylineCommand
  class MakiochiNotice
    def initialize()
      @targeturl = Myline::MAKIOCHI_URL
    end

    def get_notice_data
      uri = URI.parse(@targeturl)
      response = Net::HTTP.get(uri)
      response.force_encoding("utf-8")
      regexp = Regexp.new("<dl id=info-body>(.+?)<\/dl>", Regexp::MULTILINE)
      notice = regexp.match(response)
      @array = notice.to_s.scan(/<dt>(.+?)<\/dt>.+?<a href.+?>(.+?)<\/a>.*?<\/dd>/m)
    end

    def newnotice
      post_message = ["牧落幼稚園の情報です"]
      @array.each do |e|
        flg = true
        f = File.open("makiochi.yml", "a+:UTF-8")
        f.readlines.each do |line|
          (day, notice) = line.chomp.split(" : ")
          if day == e[0] && notice == e[1]
            flg = false
          end
        end
        if flg == true
          post_message.push("#{e[0]}:#{e[1]}が新着情報です")
          f.puts("#{e[0]} : #{e[1]}")
        end
        f.close
      end
      post_message
    end
  end
end

