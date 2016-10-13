require 'spec_helper'
require 'myline_command/unbrella_adviser'

describe "unbrella adviser" do
  before do
    @app ||= MylineCommand::UnbrellaAdviser.new
  end

  it 'UnbrellaAdviserオブジェクトが生成されている' do
    expect(@app).to be_an_instance_of(MylineCommand::UnbrellaAdviser)
  end

  it '今日と明日の降水確率と傘の必要性がハッシュで帰ってくる' do
    result = @app.get_umbrella_data
    expect(result[:today_rainypercent]).to match(/^\d+$/)
    expect(result[:today_umbrella_advice]).to be_truthy
    expect(result[:tomorrow_rainypercent]).to match(/^\d+$/)
    expect(result[:tomorrow_umbrella_advice]).to be_truthy
  end
end
