require 'messenger'

describe Messenger do

  subject(:messenger) {described_class.new(5)}

  context '#send_text' do

  	it 'sends a text to the customer' do
  		allow(messenger).to receive(:send_text)
  	end

  end

end