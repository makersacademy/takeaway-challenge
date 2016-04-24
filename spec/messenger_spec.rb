require 'messenger'

describe Messenger do
  
  subject(:messenger){ described_class.new }
  
  it 'gets the time 30 mins from now' do
    expect(messenger.delivery_time).to eq (Time.now + 60*30).strftime("%H:%M")
  end
  
  it '#send_text sends a message' do
    allow(messenger).to receive(:send_text).and_return(nil)
    expect(messenger).to respond_to(:send_text)
  end
  
end