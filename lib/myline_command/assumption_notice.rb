require 'net/http'
require 'myline/secret'

module MylineCommand
  def initialize()
    @targeturl = Myline::ASSUMPTION_URL
  end

  def get_html_source()
    uri = URI.Parse(@targeturl)
    response = Net::HTTP.get(uri)
    response.force_encoding("utf-8")
    notice = response =~ /<div id="news-wrap">.+?<\/div>/
    @array = notice.scan(/<dt class="news">.+?<\/dd>)
  end
end
