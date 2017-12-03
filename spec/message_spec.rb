require_relative "../lib/message.rb"

describe Message do
subject(:message) {described_class.new}

it "should know what time the order was completed" do
  expect(message.completed_timestamp).to eq Time.now
end
end
