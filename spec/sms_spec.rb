require "sms"

describe SMS do
    subject(:sms) { SMS.new }
    it { is_expected.to respond_to(:send_sms) }

    describe '#send' do  
    it "sends sms message" do
            allow(sms).to receive(:send_sms)
            expect(sms).to receive(:send_sms)
            sms.send_sms
        end
    end

  it "has the current time + 1 hour stamped on the text" do
    expect(sms.__send__(:delivery_time)).to eq (Time.now + SMS::DELIVERY_TIME_ESTIMATE).strftime("%I:%M %p")
  end
end