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
      @response.sub!(/<\/p><p>/, '')
    end

    def hib_stock?()
      f1 = (@response =~ /<h2>.*?ヒブワクチン.*?供給開始.*?<\/h2>/)
      f2 = (@response =~ /<div class="nwestext">.*?ヒブワクチン.*?供給開始.*?<\/div>/)
      f1 || f2
    end

    def hib_notice?()
      f1 = (@response =~ /<h2>.*?ヒブワクチン.*?お知らせ.*?<\/h2>/)
      f2 = (@response =~ /<div class="nwestext">.*?ヒブワクチン.*?お願い申し上げます.*?<\/div>/)
      f1 || f2
    end
  end
end
