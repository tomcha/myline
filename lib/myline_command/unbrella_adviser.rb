# encoding: utf-8
require 'net/http'

module MylineCommand
  class UnbrellaAdviser
    def initialize()
      #近畿地方 大阪府のデータ
      @targeturl = 'https://tenki.jp/indexes/umbrella/6/30/6200/'
    end

    def get_umbrella_data
      uri = URI.parse(@targeturl)
      res = Net::HTTP.get(uri)
      res.force_encoding("utf-8")
      res =~ /<dl id="exponentLargeLeft">(.+?)<\/dl>/m
      today_html = $1
      today_html =~ /alt="指数:(.+?):(.+?)"/
      @today_rainypercent = $1
      @today_umbrella_advice = $2

      res =~ /<dl id="exponentLargeRight">(.+?)<\/dl>/m
      tomorrow_html = $1
      tomorrow_html =~ /alt="指数:(.+?):(.+?)"/
      @tomorrow_rainypercent = $1
      @tomorrow_umbrella_advice = $2

      umbrella_data = {today_rainypercent: @today_rainypercent,
                       today_umbrella_advice: @today_umbrella_advice,
                       tomorrow_rainypercent: @tomorrow_rainypercent,
                       tomorrow_umbrella_advice: @tomorrow_umbrella_advice}
      return umbrella_data
    end
  end
end
