require 'date'

module MylineCommand
  class DustCalender
    def initialize(*day)
      if (day.size > 0)
        @today = day[0]
        @tomorrow = @today + 1
      else
        @today = Date.today
        @tomorrow = @today + 1
      end
    end

    def check_schedule
      today_schedule = schedule(@today)
      for i in (0..today_schedule.size) do
        today_schedule[i] = '今日は' + today_schedule[i] + 'だよ' if today_schedule[i] != nil
      end

      tomorrow_schedule = schedule(@tomorrow)
      for i in (0..tomorrow_schedule.size) do
        tomorrow_schedule[i] = '明日は' + tomorrow_schedule[i] + 'だよ' if tomorrow_schedule[i] != nil
      end

      return [today_schedule, tomorrow_schedule]
    end

    def schedule(judges_day)
      schedule = Array.new
      case judges_day.wday
      when 1
        schedule << '燃えるゴミの日'
      when 2
        if ((judges_day.day > 7 && judges_day.day < 15) || (judges_day.day > 21 && judges_day.day < 29))
          schedule << '不燃、危険、大型、ペットボトルの日'
        end
      when 3
        if (judges_day.day < 8 || (judges_day.day > 14 && judges_day.day < 22))
          #第1、第3水曜日
          schedule << 'かん・びんの日'
        end
      when 4
        schedule << '燃えるゴミの日'
        if (judges_day.day < 8 || (judges_day.day > 14 && judges_day.day < 22))
          #第1、第3木曜日
          schedule << '廃品回収の日'
        end
      end
      schedule.flatten
      return schedule
    end
  end
end
__END__

燃えるゴミ　月・木
かん・びん　1,3水
ペット、不燃、危険、大型　2,4火
廃品改修　1,3木
