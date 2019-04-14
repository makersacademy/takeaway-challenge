require 'time'
require 'sms'

describe Sms do

  let(:sms) { described_class.new }
  let(:eta) { (Time.now + 3600).to_s[11..15] }

  describe '#send' do
    it "sends an sms" do
      expect(sms).to receive(:send)
      sms.send
    end

    it "unit tests create" do # needs description
      # needs test
    end

    it "unit tests client_info" do # needs description
      # needs test
    end
  end

end
