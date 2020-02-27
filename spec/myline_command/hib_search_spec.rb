require 'spec_helper'
require 'myline_command/hib_search'

describe "hib search" do
  before do
    @app ||= MylineCommand::HibSearch.new
  end

  it 'HibSearchオブジェクトが生成されている' do
    expect(@app).to be_an_instance_of(MylineCommand::HibSearch)
  end
end
