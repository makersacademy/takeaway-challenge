require 'message'

describe Message do

  let(:message) {described_class.new}

  context '#send_text' do
  	it 'sends a text to the customer' do
  		allow(message).to receive(:send_text)
  	end
  end

end
