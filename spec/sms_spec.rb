require 'time'
require 'sms'

describe Sms do

  let(:time) { (Time.now + 3600).to_s[11..15] }

  describe '#send' do
    it "sends an sms" do
      # needs test
    end
  end

end
