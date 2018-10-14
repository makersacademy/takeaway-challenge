require 'text'
require 'vcr'

describe Text do

    describe '#time' do
      it 'tells me the time that my order is due to be delivered' do
        text = Text.new
        time = Time.new + 60 * 60 * Text::HOURS_UNTIL_ARRIVAL
        expect(text.time).to eq time.strftime("%H:%M")
      end
    end
    describe '#send_sms' do
      it { is_expected.to respond_to(:send_sms) }
    end
    it "receives a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      subject.send_sms
    end
  end
end
