require "messaging"

describe Message do 
subject(:message) {described_class.new}



it "should send a text message" do

 thank_you_message = "Thank you! Your order was placed and will be delivered before #{one_hours_time}"
 allow(message).to receive(:text_message) {thank_you_message}
 expect(message.text_message).to eq thank_you_message
 end


end
