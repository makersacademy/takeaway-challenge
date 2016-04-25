require "message"

describe Message do

subject(:message) { described_class.new }

 describe "#send" do

   it "sends message with time in" do
     message = "Thank you! Your order was placed and will be delivered before 12:00"
     allow(subject).to receive(:send) {message}
     expect(subject.send).to eq message
   end

 end

end
