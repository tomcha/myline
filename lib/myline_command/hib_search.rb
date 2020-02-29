require 'net/http'
require 'myline/secret'

module MylineCommand
  class HibSearch
    def initialize()
      @targeturl = Myline::HOSPITAL_URL
    end

    def get_hibdata()
      uri = URI.parse(@targeturl)
      @response = Net::HTTP.get(uri)
      @response.force_encoding("utf-8")
      @response.gsub!(/(\n|\r\n)/, '')
      @response.gsub!(/(<strong>|<\/strong>)/, '')
      @response.gsub!(/<\/p><p>/, '')
    end

    def hib_stock?()
      p @response
      f1 = (@response =~ /<h2>.*?ヒブワクチン.*?(供給開始|再開).*?<\/h2>/)
      f2 = (@response =~ /<div class="newstext">.*?ヒブワクチン.*?(供給開始|再開).*?<\/div>/)
      f1 || f2
    end

    def hib_notice?()
      f1 = (@response =~ /<h2>.*?ヒブワクチン.*?お知らせ.*?<\/h2>/)
      f2 = (@response =~ /<div class="newstext">.*?ヒブワクチン.*?お願い申し上げます.*?<\/div>/)
      f1 || f2
    end
  end
end
