require 'send_sms'

describe Text do
  describe '#time' do
  let (:time) {double :time} 
    it 'returns the current time + 1h' do
    expect(subject.time).to eq (Time.new + 3600).strftime("%H:%M").to_s
    end
  end	
  describe '#text_send' do
    it 'sends an SMS message' do
      receiver = double("receiver")
      receiver.stub(:text_send).and_return("Thank you! Your order was placed and will be delivered before ")
      receiver.text_send.should eq("Thank you! Your order was placed and will be delivered before ")
     end
   end  	
end

