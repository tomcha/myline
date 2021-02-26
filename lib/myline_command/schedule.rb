require 'yaml'

module MyLineCommand
  class Schedule
    def initialize
      @schedule_file = 'schedule.yml'
    end

    def readScheduleData
      @data = open(@schedule_file, 'r'){
        |f| YAML.load(f)
      }
      p @data
    end

    def search_tomorrow_event
    end

    def search_today_event
    end
  end
end
