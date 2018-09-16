require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require 'sms_receiver_app'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

describe "My Sinatra Application" do
  it "should allow accessing sms-takeaway-order page" do
    get '/sms-takeaway-order'
    expect(last_response).to be_ok
  end
end
