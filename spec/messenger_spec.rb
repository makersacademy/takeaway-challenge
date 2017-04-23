require 'messenger'

describe Messenger do

  it 'sends a payment confirmation text message' do
   expect(subject).to receive(:send_text).with("Thank you for your order: £20.93")
   subject.send_text("Thank you for your order: £20.93")
  end
  
end
