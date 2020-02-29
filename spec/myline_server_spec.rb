require 'spec_helper'
#require 'myline_server'

describe 'myline' do
  it 'has a version number' do
    expect(Myline::VERSION).not_to be nil
  end
end

