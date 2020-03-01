require 'spec_helper'
require 'myline_command/hib_search'

describe "hib search" do
  before do
    @app ||= MylineCommand::HibSearch.new
    @app.get_hibdata
  end

  it 'HibSearchオブジェクトが生成されている' do
    expect(@app).to be_an_instance_of(MylineCommand::HibSearch)
  end

  it '現時点でヒブワクチン供給開始のお知らせが無いこと' do
    false == @app.hib_stock?()
  end

  it '現時点でヒブワクチン供給停止のお知らせが有ること'do
    true == @app.hib_notice?()
  end
end
