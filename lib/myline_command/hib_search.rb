require 'net/http'

module MyLineCommand
  class HibSearch
    def initialize()
      @targeturl = Myline::HOSPITAL_URL
    end

    def get_hibdata()
      uri = URI.parse(@targeturl)
      response = Net::HTTP.get(uri)
    end

    def hib_stock?(response_html)
      f1 = (response_html=~ /<h2>.+?ヒブワクチン.*?供給開始.+?<\/h2>/)
      f2 = (response_html=~ /<div class="nwestext">.+?ヒブワクチン.*?供給開始.+?<\/div>/)
      f1 || f2
    end
  end
end
