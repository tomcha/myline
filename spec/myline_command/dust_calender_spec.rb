require 'spec_helper'
require 'myline_command/dust_calender'

describe "DustCalender" do

  before do
    #日曜日のテスト
    #月曜日のテスト
    @fst_monday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-2'))
    @snd_monday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-9'))
    @trd_monday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-16'))
    @for_monday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-23'))
    @fif_monday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-30'))

    #火曜日のテスト
      #何週目 0-1, 1-2, 2-3, 3-4, 4-5
      # 6/7~
    @fst_tuesday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-3'))
    @snd_tuesday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-10'))
    @trd_tuesday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-17'))
    @for_tuesday ||= MylineCommand::DustCalender.new(Date.parse('2020-3-24'))
    #水曜日のテスト
      #何週目 0-1, 1-2
      # 6/1~
    @fst_wednsday ||= MylineCommand::DustCalender.new(Date.parse('2016-6-1'))
    @snd_wednsday ||= MylineCommand::DustCalender.new(Date.parse('2016-6-8'))
    @trd_wednsday ||= MylineCommand::DustCalender.new(Date.parse('2016-6-15'))
    @for_wednsday ||= MylineCommand::DustCalender.new(Date.parse('2016-6-22'))
    @fif_wednsday ||= MylineCommand::DustCalender.new(Date.parse('2016-6-29'))
      # 12/7~
    @fst_wednsday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-12-7'))
    @snd_wednsday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-12-14'))
    @trd_wednsday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-12-21'))
    @for_wednsday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-12-28'))
    #木曜日のテスト
      #何週目
      # 12/1~
    @fst_thursday ||= MylineCommand::DustCalender.new(Date.parse('2016-12-1'))
    @snd_thursday ||= MylineCommand::DustCalender.new(Date.parse('2016-12-8'))
    @trd_thursday ||= MylineCommand::DustCalender.new(Date.parse('2016-12-15'))
    @for_thursday ||= MylineCommand::DustCalender.new(Date.parse('2016-12-22'))
    @fif_thursday ||= MylineCommand::DustCalender.new(Date.parse('2016-12-29'))
      # 7/7~
    @fst_thursday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-7-7'))
    @snd_thursday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-7-14'))
    @trd_thursday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-7-21'))
    @for_thursday2 ||= MylineCommand::DustCalender.new(Date.parse('2016-7-28'))

    #日曜日、月曜日のテスト
    @sunday ||= MylineCommand::DustCalender.new(Date.parse('2016-1-3'))
    @monday ||= MylineCommand::DustCalender.new(Date.parse('2016-1-11'))
    #金曜日、土曜日のテスト
    @friday ||= MylineCommand::DustCalender.new(Date.parse('2016-1-8'))
    @saturday ||= MylineCommand::DustCalender.new(Date.parse('2016-1-9'))
  end

  describe "今日が日曜日のとき" do
    it "明日、燃えるゴミの日が出力されること" do
      expect((@sunday.check_schedule)[0]).to eq []
      expect((@sunday.check_schedule)[1]).to match_array('明日は燃えるゴミの日だよ')
    end
  end

  describe "今日が月曜日のとき" do
    it "今日、燃えるゴミの日が出力されること" do
      expect((@monday.check_schedule)[0]).to match_array('今日は燃えるゴミの日だよ')
    end

    describe "明日が第1火曜日のとき" do
      it "明日は不燃、危険、大型、ペットボトルの日が出力されない" do
        expect((@fst_monday.check_schedule)[1]).to eq [] #to match_array('明日は不燃、危険、大型ゴミの日')
      end
    end
    describe "明日が第2火曜日のとき" do
      it "明日は不燃、危険、大型、ペットボトルの日が出力されること" do
        expect((@snd_monday.check_schedule)[1]).to match_array('明日は不燃、危険、大型、ペットボトルの日だよ')
      end
    end
    describe "明日が第4火曜日のとき" do
      it "明日は不燃、危険、大型、ペットボトルの日が出力されること" do
        expect((@for_monday.check_schedule)[1]).to match_array('明日は不燃、危険、大型、ペットボトルの日だよ')
      end
    end
    describe "明日が第5火曜日のとき" do
      it "明日は不燃、危険、大型、ペットボトルの日が出力されない" do
        expect((@fif_monday.check_schedule)[1]).to eq [] #to match_array('明日は不燃、危険、大型ゴミの日')
      end
    end
  end

  describe "今日が火曜日のとき" do
    describe "今日が第1火曜日のとき" do
      it "今日は不燃、危険、大型、ペットボトルの日が出力されないこと" do
        expect((@fst_tuesday.check_schedule)[0]).to eq []
      end
    end
    describe "今日が第2火曜日のとき" do
      it "今日は不燃、危険、大型、ペットボトルの日が出力されること" do
        expect((@snd_tuesday.check_schedule)[0]).to eq ['今日は不燃、危険、大型、ペットボトルの日だよ']
      end
    end
    describe "今日が第3火曜日のとき" do
      it "今日は不燃、危険、大型、ペットボトルの日が出力されないこと" do
        expect((@trd_tuesday.check_schedule)[0]).to eq []
      end
    end
    describe "今日が第4火曜日のとき" do
      it "今日は不燃、危険、大型、ペットボトルの日が出力されること" do
        expect((@for_tuesday.check_schedule)[0]).to eq ['今日は不燃、危険、大型、ペットボトルの日だよ']
      end
    end

    describe "明日が第1水曜日のとき" do
      it "明日はかん・びんの日が出力されること" do
        expect((@fst_tuesday.check_schedule)[1]).to match_array('明日はかん・びんの日だよ')
      end
    end
    describe "明日が第2水曜日のとき" do
      it "明日はかん・びんの日が出力されないこと" do
        expect((@snd_tuesday.check_schedule)[1]).to eq []
      end
    end
    describe "明日が第3水曜日のとき" do
      it "明日はかん・びんの日が出力されること" do
        expect((@trd_tuesday.check_schedule)[1]).to match_array('明日はかん・びんの日だよ')
      end
    end
  end

  describe "今日が水曜日のとき" do
    describe "今日が第1水曜日、明日が第1木曜日のとき" do
      it "今日はかん・びんの日が出力され、明日は燃えるゴミ、廃品回収の日が出力されること" do
        expect((@fst_wednsday.check_schedule)[0]).to match_array('今日はかん・びんの日')
        expect((@fst_wednsday.check_schedule)[1]).to match_array(['明日は燃えるゴミの日', '明日は廃品回収の日'])
      end
    end
    describe "今日が第2水曜日、明日が第2木曜日のとき" do
      it "今日は危険大型ゴミの日が出力され、明日は燃えるゴミが出力されること" do
        expect((@snd_wednsday.check_schedule)[0]).to match_array('今日は不燃、危険、大型、ペットボトルの日')
        expect((@snd_wednsday.check_schedule)[1]).to match_array('明日は燃えるゴミの日')
      end
    end
    describe "今日が第3水曜日、明日が第3木曜日のとき" do
      it "今日はかん・びんの日が出力され、明日は燃えるゴミ、廃品回収の日が出力されること" do
        expect((@trd_wednsday.check_schedule)[0]).to match_array('今日はかん・びんの日')
        expect((@trd_wednsday.check_schedule)[1]).to match_array(['明日は燃えるゴミの日', '明日は廃品回収の日'])
      end
    end
    describe "今日が第4水曜日、明日が第4木曜日のとき" do
      it "今日は危険大型ゴミの日が出力され、明日は燃えるゴミが出力されること" do
        expect((@for_wednsday.check_schedule)[0]).to match_array('今日は不燃、危険、大型、ペットボトルの日')
        expect((@for_wednsday.check_schedule)[1]).to match_array('明日は燃えるゴミの日')
      end
    end

    describe "今日が第1水曜日、明日が第2木曜日のとき" do
      it "今日はかん・びんの日が出力され、明日は燃えるゴミが出力されること" do
        expect((@fst_wednsday.check_schedule)[0]).to match_array('今日はかん・びんの日')
        expect((@fst_wednsday.check_schedule)[1]).to match_array(['明日は燃えるゴミの日', '明日は廃品回収の日'])
      end
    end
    describe "今日が第2水曜日、明日が第3木曜日のとき" do
      it "今日は危険大型ゴミの日が出力され、明日は燃えるゴミ、廃品回収の日が出力されること" do
        expect((@snd_wednsday.check_schedule)[0]).to match_array('今日は不燃、危険、大型、ペットボトルの日')
        expect((@snd_wednsday.check_schedule)[1]).to match_array('明日は燃えるゴミの日')
      end
    end
    describe "今日が第3水曜日、明日が第4木曜日のとき" do
      it "今日はかん・びんの日が出力され、明日は燃えるゴミが出力されること" do
        expect((@trd_wednsday.check_schedule)[0]).to match_array('今日はかん・びんの日')
        expect((@for_wednsday.check_schedule)[1]).to match_array('明日は燃えるゴミの日')
      end
    end
    describe "今日が第4水曜日、明日が第5木曜日のとき" do
      it "今日は危険大型ゴミの日が出力され、明日は燃えるゴミ、廃品回収の日が出力されること" do
        expect((@for_wednsday.check_schedule)[0]).to match_array('今日は不燃、危険、大型、ペットボトルの日')
        expect((@trd_wednsday.check_schedule)[1]).to match_array(['明日は燃えるゴミの日', '明日は廃品回収の日'])
      end
    end
  end

  describe "今日が木曜日のとき" do
    describe "今日が第1木曜日のとき" do
      it "今日は燃えるゴミ、廃品回収の日が出力されること" do
        expect((@fst_thursday.check_schedule)[0]).to match_array(['今日は燃えるゴミの日', '今日は廃品回収の日'])
        expect((@fst_thursday.check_schedule)[1]).to eq []
        expect((@fst_thursday2.check_schedule)[0]).to match_array(['今日は燃えるゴミの日', '今日は廃品回収の日'])
        expect((@fst_thursday2.check_schedule)[1]).to eq []
      end
    end
    describe "今日が第2木曜日のとき" do
      it "今日は燃えるゴミが出力されること" do
        expect((@snd_thursday.check_schedule)[0]).to match_array('今日は燃えるゴミの日')
        expect((@snd_thursday.check_schedule)[1]).to eq []
        expect((@snd_thursday2.check_schedule)[0]).to match_array('今日は燃えるゴミの日')
        expect((@snd_thursday2.check_schedule)[1]).to eq []
      end
    end
    describe "今日が第3木曜日のとき" do
      it "今日は燃えるゴミ、廃品回収の日が出力されること" do
        expect((@trd_thursday.check_schedule)[0]).to match_array(['今日は燃えるゴミの日', '今日は廃品回収の日'])
        expect((@trd_thursday.check_schedule)[1]).to eq []
        expect((@trd_thursday2.check_schedule)[0]).to match_array(['今日は燃えるゴミの日', '今日は廃品回収の日'])
        expect((@trd_thursday2.check_schedule)[1]).to eq []
      end
    end
    describe "今日が第4木曜日のとき" do
      it "今日は燃えるゴミが出力されること" do
        expect((@for_thursday.check_schedule)[0]).to match_array('今日は燃えるゴミの日')
        expect((@for_thursday.check_schedule)[1]).to eq []
        expect((@for_thursday2.check_schedule)[0]).to match_array('今日は燃えるゴミの日')
        expect((@for_thursday2.check_schedule)[1]).to eq []
      end
    end
    describe "今日が第5木曜日のとき" do
      it "今日は燃えるゴミが出力されること" do
        expect((@fif_thursday.check_schedule)[0]).to match_array('今日は燃えるゴミの日')
        expect((@fif_thursday.check_schedule)[1]).to eq []
      end
    end
  end

  describe "今日が金曜日のとき" do
    it "何も出力されないこと" do
      expect((@friday.check_schedule)[0]).to eq []
      expect((@friday.check_schedule)[1]).to eq []
    end
  end

  describe "今日が土曜日のとき" do
    it "何も出力されないこと" do
      expect((@saturday.check_schedule)[0]).to eq []
      expect((@saturday.check_schedule)[1]).to eq []
    end
  end

end
