require "confirmation"
require 'vcr'
require 'webmock'

describe Confirmation do
  context "---finalizing the order if conditions are met---" do
    it "returns the time before the order must be delivered" do
      expect(subject.delivery_time).to be_instance_of(String)
    end

    it "receives a text message after the order is placed" do
      VCR.use_cassette('twilio') do
        subject.send_text
      end
    end
  end
end
