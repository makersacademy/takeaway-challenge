require 'takeaway'

RSpec.describe Takeaway do

  # subject(:takeaway) { described_class.new(menu, order) }
  # let(:order) { double :order }
  # let(:menu) { double :menu }
  # let(:curry) { double "curry" => 7 }
  # let(:pizza) { double "pizza" => 5 }

  describe '#diplay' do

    it 'has a method to issue the menu' do
      expect(subject).to respond_to(:display)
    end

  end

  describe '#order' do

    it 'has a method to accept an order' do
      expect(subject).to respond_to(:add_to_order)
    end

    it 'can accept an order' do
      allow(subject.add_to_order("pizza")).to receive(:add_to_order)
    end

    it 'can view the basket' do
      subject.add_to_order("pizza")
      expect(subject.basket).to eq(["pizza"])
    end

    it 'can view a total' do
      subject.add_to_order("pizza")
      subject.add_to_order("curry")
      expect{subject.total_order}.to output("Your order total is £12").to_stdout
    end
  end
end
