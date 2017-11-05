require 'text'

describe Text do
  describe '#send_text' do
    it 'responds to send_text' do
      expect(subject).to respond_to(:send_text).with(1).argument
    end
  end
  describe '#text_response' do
    it 'returns text response in TWIML when total is 34' do
      expect(subject.text_response(34)).to eq "<Response>\n      <Message>\n        Your order total is £34 and you will receive it no later than #{$hour_later}. Thank you!\n      </Message>\n    </Response>"
    end
  end
end
