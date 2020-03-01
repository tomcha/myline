require 'net/http'
require 'myline/secret'

module MylineCommand
  class HibSearch
    def initialize()
      @targeturl = Myline::HOSPITAL_URL
    end

    def get_hibdata()
      uri = URI.parse(@targeturl)
      response = Net::HTTP.get(uri)
      response.force_encoding("utf-8")
      response.gsub!(/(\n|\r\n)/, '')
      response.gsub!(/(<strong>|<\/strong>)/, '')
      response.gsub!(/<\/p><p>/, '')
      @array = response.scan(/<div.+?<\/div>/)
    end

    def hib_stock?()
      f1, f2 = false, false
      @array.each do |element|
        f1 ||= (/<h2>.*?ヒブワクチン.*?(供給開始|再開).*?<\/h2>/ === element)
        f2 ||= (/ヒブワクチン.*?(供給開始|再開)/ === element)
      end
      f1 || f2
    end

    def hib_notice?()
      f1, f2 = false, false
      @array.each do |element|
        f1 ||= (/<h2>.*?ヒブワクチン.*?お知らせ.*?<\/h2>/ === element)
        f2 ||= (/ヒブワクチン.*?お願い申し上げます/ === element)
      end
      f1 || f2
    end
  end
end
