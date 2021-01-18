require 'spec_helper'
require 'text'

describe Text do

  include SmsSpec::Helpers
  include SmsSpec::Matchers



    it "receives a number" do
      expect(subject).to respond_to(:send).with(1).argument
    end

    # it "sends a message" do
    #   subject.send("+441234567890")
    #   current_text_message.should have_body "Thank you for registering. To confirm your subscript reply YES."
    # end

end
