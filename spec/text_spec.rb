require 'text'

describe Text do

subject(:text) {double :text}

  context '#send_text' do
    it 'should send sms after the order is completed' do
      allow(text).to receive(:send_text)
      expect(text.send_text)
    end  
  end
end
