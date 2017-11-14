require 'text'

describe Text do

  let(:twilio_messages) { double(:twilio_class, create: true) }
  let(:twilio_instance) { double(:twilio_class, messages: twilio_messages) }
  let(:twilio_class) { double(:twilio_class, new: twilio_instance) }
  subject(:text) { described_class.new(twilio_class) }

  describe '#send_text' do
    it 'responds to send_text' do
      expect(subject.send_text(34)).to eq true
    end
  end
  describe '#text_response' do
    it 'returns text response in TWIML when total is 34' do
      expect(subject.text_response(34)).to eq "<Response>\n      <Message>\n        Your order total is £34 and you will receive it no later than #{$hour_later}. Thank you!\n      </Message>\n    </Response>"
    end
  end
  describe '#send_menu' do
    it 'returns string in TWIML with hello' do
      expect(subject.send_menu('hello')).to eq "<Response>\n      <Message>\n        hello\n      </Message>\n    </Response>"
    end
  end
end
