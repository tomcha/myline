require 'myline'
require 'myline_server/server'
require 'sinatra/base'

# Your code goes here...
module MylineServer
  class ResponseServer < Sinatra::Base
    get '/' do
      'test done'
    end

    get '/callback' do
      'callback'
    end
  end
end
