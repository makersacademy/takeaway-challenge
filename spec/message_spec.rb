require_relative "../lib/message.rb"

describe Message do
time = Time.now
subject(:message) {described_class.new(time)}


it "should know what time the order was completed" do
  expect(subject.order_timestamp).to eq time
end

it "should know how long delivery will take" do
  expect(subject.delivery_time). to eq (time + Message::DELIVERY_TIME)
end
end
