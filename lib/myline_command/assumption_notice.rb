require 'net/http'
require 'myline/secret'

module MylineCommand
  class AssumptionNotice
    def initialize()
      @targeturl = Myline::ASSUMPTION_URL
    end

    def get_notice_data()
      uri = URI.parse(@targeturl)
      response = Net::HTTP.get(uri)
      response.force_encoding("utf-8")
      regexp = Regexp.new("<dl class=\"news\">(.+?)<\/dl>", Regexp::MULTILINE)
      notice = regexp.match(response)
      @array = notice.to_s.scan(/<dt class="news">(.+?)<\/dt>.+?<a href.+?>(.+?)<\/a>.+?<\/dd>/m)
      p @array
    end
  end
end
