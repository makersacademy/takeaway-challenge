require_relative "../lib/message.rb"

describe Message do
time = Time.now
subject(:message) {described_class.new(time)}


it "should know what time the order was completed" do
  expect(subject.compl_timestamp).to eq time
end
end
