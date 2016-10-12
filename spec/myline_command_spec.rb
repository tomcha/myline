require 'spec_helper'
require 'myline_command'

describe 'myline_command' do
  it 'has a version number' do
    expect(Myline::VERSION).not_to be nil
  end
end
