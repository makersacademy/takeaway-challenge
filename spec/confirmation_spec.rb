require 'confirmation'

describe Confirmation do
  let(:item) { double(:item) }

  before(:each) do
    allow(subject).to receive(:confirmation_text).and_return "This is a message to confirm the order of your food delivery to arrive at #{Confirmation::TIMEPLUS1}"
  end

  context '#confirm order (e.g. enter pressed as input)' do
    it 'should get the user input of '' return confirmation text' do
      allow($stdout).to receive(:write)
      allow(subject).to receive(:gets).and_return("")
      expect(subject.confirmation_of_order(Order.new)).to eq("This is a message to confirm the order of your food delivery to arrive at #{Confirmation::TIMEPLUS1}")
    end
  end

  context '#do not confirm order (e.g. abc pressed as input)' do
    it 'should get the user input of "abc" and return "Order not confirmed"' do
      allow($stdout).to receive(:write)
      allow(subject).to receive(:gets).and_return("abc")
      expect(subject.confirmation_of_order(Order.new)).to eq("Order not confirmed")
    end
  end
end
