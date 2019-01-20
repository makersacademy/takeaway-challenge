require 'confirmation'

describe Confirmation do
let(:item) { double(:item) }

  it "should sent a text when the order is confirmed" do
    expect(subject.confirmation_text).to eq("Text")
  end

  context '#confirm order (e.g. enter pressed as input)' do
    it "should get the user input of '' return confirmation text" do
      allow($stdout).to receive(:write)
      allow(subject).to receive(:gets).and_return("")
      expect(subject.confirmation_of_order(Order.new)).to eq("Text")
    end
  end

  context '#do not confirm order (e.g. abc pressed as input)' do
    it "should get the user input of 'abc' and return 'Order not confirmed'" do
      allow($stdout).to receive(:write)
      allow(subject).to receive(:gets).and_return("abc")
      expect(subject.confirmation_of_order(Order.new)).to eq("Order not confirmed")
    end
  end
end
