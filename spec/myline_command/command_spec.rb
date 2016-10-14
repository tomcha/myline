require 'myline_command/command'

describe 'command' do
  before do
    @command ||= MylineCommand::Command.new
  end

  it 'Commandオブジェクトが生成されている' do
    expect(@command).to be_an_instance_of(MylineCommand::Command)
  end
end
