require 'texter'

describe Text do

  subject(:text) { described_class.new }

  describe '#send_message' do
    it '1.0 creates a message' do
      allow(text).to receive(:send_message).and_return(MyOrder::MESSAGE)
      expect(text.send_message).to eq MyOrder::MESSAGE
    end



  end

end
