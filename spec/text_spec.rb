require 'text'
require '../.env.rb'
require 'twilio-ruby'

describe Text do
  it { is_expected.to respond_to :time }

  it { is_expected.to respond_to :send_text}

end
