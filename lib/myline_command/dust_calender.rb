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
        today_schedule[i] = '今日は' + today_schedule[i] if today_schedule[i] != nil
      end

      tomorrow_schedule = schedule(@tomorrow)
      for i in (0..tomorrow_schedule.size) do
        tomorrow_schedule[i] = '明日は' + tomorrow_schedule[i] if tomorrow_schedule[i] != nil
      end

      return [today_schedule, tomorrow_schedule]
    end

    def schedule(judges_day)
      schedule = Array.new
      case judges_day.wday
      when 1
        schedule << '燃えるゴミの日'
      when 3
        if (judges_day.day < 8 || (judges_day.day > 14 && judges_day.day < 22))
          #第1、第3水曜日
          schedule << 'かん・びんの日'
        elsif (judges_day.day < 29)
          #第2、第4水曜日
          schedule << '不燃、危険、大型、ペットボトルの日'
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
ペット、不燃、危険、大型　2,4水
廃品改修　1,3木

    def initialize(*weeknumber)
      if (weeknumber.size > 0)
#      #テスト用イニシャライザ
        judes_day_weeknumber = weeknumber[0]
        judes_morrow_weeknumber = weeknumber[0]
        judes_day_weekday = weeknumber[1]
      else
        judes_day_weeknumber = ((Time.now.day) / 7) + 1
        judes_morrow_weeknumber = (((Time.now) + 60 * 60 * 24).day) / 7) + 1
        judes_day_weekday = Time.now.wday
      end
    end

    def tomorrow_schedule
      tomorrow_schedule = Array.new
      case judes_day_weekday
      when 0
        tomorrow_schedule << '明日は燃えるゴミの日'
      when 2
        if (judes_day_weeknumber == 1 || @today_weeknumber == 3)
          tomorrow_schedule << '明日はかん・びんの日'
        elsif (judes_morrow_weeknumber == 2 || @tomorrow_weeknumber == 4)
          tomorrow_schedule << '明日は不燃、危険、大型ゴミの日'
        end
      when 3
        tomorrow_schedule << '明日は燃えるゴミの日'
        if (judes_morrow_weeknumber == 1 || @tomorrow_weeknumber == 3)
          tomorrow_schedule << '明日は古着・ダンボールの日'
        end
      end
      return tomorrow_schedule
    end

    def today_schedule
      today_schedule = Array.new
      case judes_day_weekday
      when 1
        today_schedule << '今日は燃えるゴミの日'
      when 3
        if (judes_day_weeknumber == 1 || @today_weeknumber == 3)
          today_schedule << '今日はかん・びんの日'
        elsif (judes_day_weeknumber == 2 || @today_weeknumber == 4)
          today_schedule << '今日は不燃、危険、大型ゴミの日'
        end
      when 4
        today_schedule << '今日は燃えるゴミの日'
        if (judes_day_weeknumber == 1 || @today_weeknumber == 3)
          today_schedule << '今日は古着・ダンボールの日'
        end
      end
      return today_schedule
    end
  end
end
