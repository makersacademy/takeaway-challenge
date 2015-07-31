require 'twilio-ruby'
require 'texter'

describe Texter do

  subject(:texter) { Texter.new }

  it "sends an SMS message" do
    texter.send_message "Thanks for the order!", 447785244600
  end

end
