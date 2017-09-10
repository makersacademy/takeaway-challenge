require './lib/text.rb'

describe Text do
  subject(:text) {described_class.new}

  describe '# send_text' do
    it 'sends a text message' do
      time = Time.now + 3600
      expect(text).to receive(:send_text).with("Thanks for the order. Your food will be with you at #{time}!")
    end
  end
end
