require 'twiliomessenger'

describe TwilioMessenger do

  subject(:twiliomessenger) { described_class.new}

  it {is_expected.to respond_to(:send_message) }
end